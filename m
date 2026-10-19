Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421588;
	b=nMDm4iIkso0Q4y3V420VQBu6b5HsDn9/7uXAOM4DsbEkKpa80YVS2BxNQIdcKpBLH2CY
	 S54Ch5ye+h7cAtMvCrYJ3HMdcrKj2DQ3+gGdZJE116/fMDGfb3DuZGkH3WVdemyxri8BS
	 pQzBHy1tF2ZyAJSAaarx1tJXMejN0uyPBSpaz6rYghou7KmShvsz8ubGsx/QtTxFUrmbP
	 Dsg4fQIkglzzIkTNzNkw4HhrAtYgdre9HDFIHbBeDb6TwR39Z6GSb/UynQANOojEeECDW
	 n0qcKh/AmG88h+RFqbTyWQ8fzG8g0Vt0Xo8n1GHNJJIH/1F8mrOSwYerCbhgTmWoY0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421588;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
	b=UJKv8SZlRl8DYUGTDGqQTEiFnZilTAbdgrJVYxoNiPfFYuFypI0PXkX59fyGzIWu3Qh6
	 ZM+O1Q/w+S1Ekcw5b173uA2cQ9f94vQcz7HzHsKX2dTsIhb/ufkpcgKOItUBK07jlYM9y
	 HXO86mn3Mb4eEvtw4dxFC9fARZxsOZaxtdLh6WMwT9okEKsy9Q5fTrP/Pt8Q8cC+FhPjl
	 G01jxvMIgy3PTHdemG0+p/gpXDQcCGhi6uzIUupMyPoWSQM4rYFucqhy4yDGSzw3By+5x
	 CM5WXQL2tdO7MIxz0etrUJOJXz92CP2zRUrvn3X/NLOWTYcydsQo5yOnmAIiNOpwLwQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD5yxaCX;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74E5C606AAD5
	for <devicetree.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD5yxaCX
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3173FDC18
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421588; cv=none; b=ePhwAh0TNQ8ROSZEmgsNtK+FqkDkCHBarosuXGnK6EMBoC5EtaQrU6BBrIPGbkb677HvRkTrEt+m0Ga/C6WUdVRvns/1AccyBPjWzMXnsUPzKVdGwJBfL/JUKchIdCsxST4dmheRTYZqbsb8kyEvvl/yr5Ii2LtLMp3+UqUw1o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421588; c=relaxed/simple;
	bh=hQxPdpCxBDIx+pPny6Aea4SoTc4k93a/FzzUSZ3WShE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cv5AL6hYqEoAmdgyxxhlE3Qch/4JDWwiR5GRpUu2u/VN/5WpDM7LTu4o8tgci/csYyOU4el70i2UkqwR6xc75pm7KY3558NHisN99IZupJVLmOW/h/ZAd9DL4KwK7FxnkUm/ewkvzjNXmb2lpCZudeux2ju7AoYgKeFG+upoHCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psM6uTXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QD5yxaCX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0BHr3485886
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=; b=psM6uTXDiOcUQQSw
	38e20UwanrY0K1ltAHo8MCrCV4Yl/CwRpA7KZpClrR4IsQz7MmZg0hp6BYQLSieo
	sazVRX5eJ/6TR0RJZdUbv+dbhwBRV6VXbSEK3VwbxZqz6CkQdI4J2DK4Uff/4JZU
	GQipnG+/JbP5N01RvuhPceAsl5+3JmjhWACD9HSeTWPPEYFKjT/RHaXUiD+4SQEh
	ciR5uTbP14DltWM/gSHDzG0G2lpWTT0u1x2m9avgQQQaODuvSwg0CmmdD8z6Jw2g
	fQZnEOclohYRFDRVqnkNt5xUSm5xYDPznjEmjZg//9OxuKmy48eoFoL6dtOvPuRX
	W3G/5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48hq7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 14:53:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so85483585a.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421585; x=1793026385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=QD5yxaCXEfhjEw3uZmOoFcMuh58hpKkt+4emq3kmI5J0CknBjsFdMp2GvAlf0Sx/2V
         z0c9aSOOn+nfzTIak6wyxhr6/0yRoaqL+XJnUo4ev5Lqub9ntjpeMyPAL50ADE5LFm4J
         t9rwlJVW3+i5B9W5VchA3aUyr9J+bDusnXBjtrYVaP29XPQPAm0XHYHHAMxukJhrF1mz
         JeKviAPjSJ+oTfrlsqVGP6lArg/3Gf6bk31qiATt16/ewUb4ovmr882EgMxMlH+8QwWH
         VQVsg9QJgvGoWMnKR46+qmZ4GPT98kPhDyUis+2s67RIUHZWp/gsX2yl4AdvMh3U1Au+
         iRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421585; x=1793026385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=BpSq1LhB9iEYOUVn0brzpLukbuWtymKm1RPwALQR5KIBscreRFptbjzblircFeHils
         wjNSwBjq3LeX3oU8xUgnGL+fpD9623CqOwqTO6zIbbzNbpN3ohIstAh9eKz5X/Fe8Toa
         BMA/qfMq/1uQs5ppdnrs431qm9xw6XtK7gORBu6wS2/MNj852PBnR4+khCkdInCDhKh0
         qSBa6iFXnjcdVoBFNnFCMVQJJIYEBB99uxoBQqU39VQOKK9JxfSjzcpgDlCUv9t+bjiD
         3tu9eUSzq6iBFaGOzekZAMB86h/rFsw85iZdCou5D6dr0XBSq0hWjtxHVi5Vmxgwn1j9
         ASlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJ9ZhXMob4LMD93Cod65QLJlzDsDn2oqVXRpIiSPXMOc2JTyfVtlBSCH3NB+0aEW6V+8WqmhzLGGcA@vger.kernel.org
X-Gm-Message-State: AFq9FYLTt8DnKW0vwd7WBFeU2jRUdKi1CzlI4Qbm9BMvU4nbKsb0zami
	ARaILkmFxKP+hj1R3XVnoP6bEliD4FqNcVeb/z8xVAu7nHxfHypX8zbMIWx6ALzyaIhJRUQPhN7
	o+cYnt6yOhuSVrDJbVWo+sZjVQP5CSZ767NKJ2sMemGjkmN82KeHndmbWWR1z2n3c
X-Gm-Gg: AYBFou2ZvFb9Rr/6XV7XMUmWQyOnNdKec2j1gOGQhM7TU5MAxMrIiw83Oh61nlp9eeR
	f200o/sD/0PXhkI7rNbWd8/nr0x7AdtC84r468O93gyMtzsfmkKz44h0NN8VTbBWmPGmHuJID6a
	dIYVZxbDXSq6qzu8AZZzP5SF4Xq+YYEcVTtIfoBzExG8RVf9gsdwmny+0mCasw6B0d63R4OyP0g
	aMgpLE0TikZ9tIjL9DfaU6FpxJH4pTh9YXV4ZRRmqN0tY0ZvR3hnXNRwqxr1ciGthBch60qYRac
	57l0Q39dhUvA1bfcxxEKT3O4hRnQrLfoXK3ZqIDaFMDGkdWoFnU1bRD66XWNE92Ynj4j3QU4Vu9
	tFboWynuWK7a6w85e+HXruw==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547533785a.5.1792421585217;
        Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547525285a.5.1792421584507;
        Mon, 19 Oct 2026 07:53:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:03 -0700 (PDT)
Message-ID: <c142bbde-a556-4ffa-b005-d12779fbcef2@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:01 +0200
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
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX97+8EqAPX2Ve
 bnqUs+tho7WjTtSyeuMkDoU28D8Gr61hdjQVPXscu7V8aG7r4vqfcFf2hfBwb5y2fv/zK6SckwE
 ViYqZE0mQqUQfkDs0qhs7Fw34sT9HzxDqajalyWAb7TeGWhZOvRmFgb5AXKbvhAntjj4VmZagXT
 zMWtkJbxZ2AaB885SCKNGaqeTqQWW3A80GLVqVsJxqatsGzZRNHnhyotJsTSYKZaCWANd8CrzMW
 yb/8dJxK79eBrwKTtaRYvRnpmEOhfWTySA5/r+SR/AceTEY1xWLLvBVQXFS+FgbTZcEyaTkucL6
 0z5hnnL9IvepjksruD9BVse3BRujbsDqgu5r9ZxIuLkkoqrNYWuP9NazJHNzv0kmZdzaEWnVl3G
 rsUfX3NZaW82NDbdjHuxobsC+PDAa4gGyfS/CEIPNfgsVgV7n+iGITK1PzmpVOQrNg4sUdlR9K9
 tonskwDrCtK5vSXEIrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXzJthjCBmClOH
 WNH04gXUdxoTFQiUI5rQWknNtEMROy/Glh6/9OZkaKlHLWxepdCJHJBuOYIM95z0lYeYdhrbRT5
 LOpPPVaDDo7Pp6rSZlljYzvBRxtvUkw=
X-Proofpoint-ORIG-GUID: XMnO166IJshYzY6MZp63g1TJVUKdzInq
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad62ed2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=JQL8vk9cGjK8yxBYMiEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: XMnO166IJshYzY6MZp63g1TJVUKdzInq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
