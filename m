Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261740;
	b=ex2T73RAbfyxZ3nVMKYBrXdyS6DAEXItzJoYKJOLsp2xXC/h60g3VWS8VuY6fEmGNIjQ
	 OQ1TGILzKv8WUQK85/+5Z06Cj4kB/7tmZgMeWCPq+zikl/DwAh2/Ie3lOhAEyBQna20uZ
	 RpHTq4vRgxDeRi53unj21PFijuiUGLKGeGXDPKEXUGaMon2VXCiSkFBc0iximqL9C/v3x
	 uVcne9e1gmDa8f+Bj5mJwGrpmoDiEb7MaGxfrSneav2NhHEg4bYCu6s5qCY/kShX/iXiq
	 w5lxV5YV78DgymI5q9VHZQazME+FkZ5ZBJJ6C/ns8iOirDKBdMqlibBYQMeWnQW/cbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261740;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
	b=gm7+2T9cpsreLCUOCiirSGYJM917xaucvbbKOCuiCmYTp086wow5YCbzo17WLNR+xa/j
	 +4o40ywsZdp/4z7PUa8vd9Ta46zZdugwtW42Heh1In1AtkZnqDArudBRg59uvJ2u/2q55
	 oXpYB5RwvWs4x2tcG/rPqYRjvkFfdWjz3+v+Kjaor5jw0kwWdjOLwHCr9zAVpYK6UhYoB
	 XcJeu22gAySws9xekY1uYh9+qlgZkVcerBinSOAHUvKuUZtUEZ0SAiZdmYfJS4MZAEwuE
	 bDkyDUWGsopAR6jUPYzEJVBfxtldZcDsJ6+XwAN+Jqukc371ZHCTbXdKMQ9O4NatzlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF3B606A322
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:15:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFF3B606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ni51Ydx+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkyhNcYy
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5Grx93294118
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=; b=Ni51Ydx+CDpqf+Rz
	ur3Ui4ghmpDtxdRogFb9VeGwX3g6B4OUCvBJRzwpPq3ayxksQoofX/d+Q7HP/dn3
	epQDJZZYEpAKPJ9p/NdBZLbtt+6T77Rx843WiSnV6JVau5SePRAqiGy9kMtTAihl
	8Dis2v39BxC/Qxo5flms6gNprWw9RdP4Ab3Ig8BXCvSgMyVAd43sZ/YK1b3oJz3p
	kzTrsAM4rOQAV/FzJe/5EO9hAkj1UkqxXqO0VMuamegIMZH6J7C96Ru71QUlZc+j
	o7RElPMcE9Pvd/l0+xPaArwyJNevPUaoannm2KAQZBSyx+eYvowlrHe6KDDoJN6+
	aEqbqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkxshrt9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 08:15:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2bdebfc5so45415785a.1
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793261737; x=1793866537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=PkyhNcYy/3eZwUiKKPY4DINNI+7O8PhgWzTx2eO+RPRgOE4iYcoXjZj+eZ8uW5d+zO
         yrDShLjGlnccCN7iJRuXTE6x4d6wqiPm9RW/pWs+7mzKq92tBUO1CsHI7aTZEoxs7stp
         DAlrXW+8Tvf5Yk1EuVFDJIPQQdEIB+TzJ7MmUHohnattdqOuLjaczGEhwrBQ2ZL6Bch3
         m2svPhgQv79xUkLytJHaeh7wMQipk//QREZKUSQZaFn0n/WvPFQV+OqxP8/0dgoevHHe
         Rrjw4LTTFNTko/IZLSDuj4TZNL8DzBzOXpLxwlmrtlU4FG1XaWiIsYBTIapqZ2W2KQA7
         iykw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793261737; x=1793866537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tl52HgfBhP7MGadRKuB2FsjKDzug2OUyie7+y3f4AwE=;
        b=vyTh77DCSAy4n7k2E934MzwPwmda7lNndeBecHejXyep5DLN+jhHw3NLsNHJGA8iXC
         SEmOTPpb4c6Sy/3T043M+hjcozjgMig+NI7+CmUb0WljUli4rHbfr0uv6ZY0HR+IqFPl
         SATr6LR6MVNs/hjoQe0f81yRSx1MvXknUPINYL7h0PWQ0UHMuiO27WD3vfBtB3n1/6jS
         z19NKt/9witODDBDtGpG5EY1g8aY3wZH2osP0BdgfmY96CkLMGVziIt7vDaqv4iu7/Sd
         sgypTybduTr9nyUz15dgyGZFe4Xiai+DInZsyliCo/NfS09XvSQkF3IkGvDu1p31D5L8
         N+0g==
X-Forwarded-Encrypted: i=1; AKwUvBz0mvDt+jHU9F9gL8UbDHp1cF0ZE4hYM2/qCIedT0Z/9Tams8VFgLo2KhegWTInUqG5YaorJoJSFBlz@vger.kernel.org
X-Gm-Message-State: AFq9FYK1n2ykQGzqA/qWA9SH/IQIZSmljP58Ns4KGAY7G/jzs5MNHI+/
	ExUTdDzPtnuvQKO7vKxNOlOfhD9hP8mnDL//XhaBLV71g5pDFB5jxM4MEnstTPcQ/9niJKD1WET
	bxu+9kyu6xUh0G9KTfxgUn58cer0SmjBprchpJnX0hBeKvUOg3N6s0d/fA34KcsAi
X-Gm-Gg: AYBFou0H7A/UC+xgIpzOlN2+NyOCvygZ3lR4vODaEy9tWDv2IuvOF9yGJo3X6B7MCpT
	Qloq/4+q8WMCmuMyjahm2rYnPbRHbHfKieHdOAUbU8qUcdlI85nDcPYxETrHZgTGdOC4XKlqGR9
	rkBuQn3DdvkMg/JcPLxgPlvHFr5HjoUwV/sa39GBDlHT2mQEkA4SWAkj03B0vEVgGrj3rLN7HVX
	MfJDJbew+W8I9CPc13sF7Gxkc37xYEb+49JQHd0WB4T9oVGmyS+TIu1ULDRCyBvBczxeHyzPg1N
	jqyNH1XoHD/44FMEwr5wD6kfVRZUyzZYSI+1wo4x0w6CJk9x+vzjkqm+IgL/HL8MQok9NNKv//r
	wdt6+ihFaikl3KVkh0+3ox/blXt71g6le+mWrjK8QI+mbJESXb5I56ym8IQvntpqmYnLfzdQ=
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690395685a.5.1793261737075;
        Thu, 29 Oct 2026 01:15:37 -0700 (PDT)
X-Received: by 2002:a05:620a:a8c7:20b0:93e:54fc:2c79 with SMTP id af79cd13be357-94408cff7dfmr690391385a.5.1793261736641;
        Thu, 29 Oct 2026 01:15:36 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b495ac4a78sm2434202a12.4.2026.10.29.01.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 01:15:35 -0700 (PDT)
Message-ID: <e67f8b50-f3b0-4a19-bbe3-d1f240ba9b2f@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:15:33 +0100
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] pinctrl: qcom: qcs615: Add gp_mn mux function
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-8-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1L25vsZyHTjQGHDECbbAYPmO5KF1Yj3Q
X-Authority-Analysis: v=2.4 cv=H6BOUOYi c=1 sm=1 tr=0 ts=6ae300a9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=UmW6FQozgp94pkqAIjUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX0+tOz6IuwL+C
 vj0RGKJEJr8rxmJly3WC8G0qNGN/XtS7dSSd+f9bkcgnd0YN7fhcVgbOg64mj8VmoYXnHrQRAB/
 uzOfjNaZ7lirHmmTA2x4DhkkVoFXhUM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzMSBTYWx0ZWRfX8GwL6AcGg/ki
 WJgUnQq63TjQbaZhsxlMgyWlfMaL+6vRQK1ElZ+ESe3KgNk57JOwRuYy/B5nuo6EUZ9o6Q2mrdG
 f/LH21mrqwJONmY03N23e/nFRvLanJVgo1SPVjAAj9o2+5XsLNEw6KrambZ2muf4KeQSIcNcVv5
 ZCxe/1bVKpVOQi+J7ejKmcl436CDKB/bSyPXJkgybRDMPIXaRR6omJJ12YQKJhCRge4FsuqM3YD
 B6mpkXn6u2JR1zZpZitqfvVGsv3r1tZSwTkzD+n2c7hwRqHokLcdHB2CuLjufRqyhwrE+f5GyGn
 jGAbhuBMrYaarx5OO9nWo3aZo36ZC4SEUM5ooUsH9sB1mNAsHuvv9TRoZc6EQAxqls51y7nanFb
 Wi4cotlaalEVw0LmOSjp9ReEv67Ssq2l4XAQYl+olOgE6Aej8Bu4B5B9E9gYwV+tSfsQe5LWF7w
 qAwTNkCgOXl4HgWVeWA==
X-Proofpoint-ORIG-GUID: 1L25vsZyHTjQGHDECbbAYPmO5KF1Yj3Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290031

On 10/26/26 12:29 PM, Taniya Das wrote:
> Add the gp_mn pin mux function on gpio29 of QCS615. This exposes the
> GP M/N divider clock output on the dedicated GPIO pin.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
