Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9F741B8CC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240069; cv=none; b=ugjZXz/lmjcTGk72a/7qBMoI48dpe0Uz0+lH1RZ/j3QRHKRW34h8tpZEwTqkjd2sEJGnwD4xfQNrkaOaZiM1KM9nBLHBqGvhjMQ9OxLDh8b5p2UejNiY5SVJ54YLcPOzmEKR8iH11GvE0Is8HT8MRJohb3abmpsxIG8i9l4KJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240069; c=relaxed/simple;
	bh=yL3m1Dg9btJVeHWrdnP8VRbNZ5yhiePsfHJrBUcz5GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eEOjiVYXRQC843TTM6D5oE4LKkzANsHnRV7QsWpu9qokN4ug+4FkIHwuRypd7zmNyOhuIBNDZOFSSQJED+ZkPSV4vM9SlvKGrs0Z9HSEYpkK2HDl9Mrugr5Yro/jwXn+VyawV3astJslXfwnjrPse0UUqj9zwARIUGLhcSXr4SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSdHniTc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFZ8Q8fK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSdHniTc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFZ8Q8fK"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBHW7w2367954
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:01:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PH+MS/OXafdOZl+CyaSuL6lgweSk0MpcC245rz5MU4o=; b=NSdHniTcBqHUfRK9
	HnJ409ylh4rghH4W6/EK4uucVg5YNDNyqhuMeKt1op10jgNVcuhBpho89bkQTQ5Y
	qGxQtLyKKxDvj+9PhnfdSHRw4NvzhKgcxhDRwHMJe9aDeIswX4VxW1ExQLro1Rzx
	C2KML8/Np+Geqyg6Q7nq0PtQxwdeImN0hxC+hz8LfmPymBOdQCjEdYBLkY8hOvLC
	QWKdYfPFDDD4NrQjtCQFA1oIhm9qTIPzSwP9UsP2PMZAfVfgeHVsgW7Z386Qxe4O
	qvusPhoUC+Uvh9lFqE3D748rHD6nh0hMPtuyorSPX5q67csPd7ic7KS4OlLiZeWU
	oslW1A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8c680-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 12:01:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51bfd1772d8so7098181cf.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 05:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240066; x=1785844866; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PH+MS/OXafdOZl+CyaSuL6lgweSk0MpcC245rz5MU4o=;
        b=SFZ8Q8fKblv9ERPtLfqtZrWUaap4wmnfkyEn4Voe1u+M3LTrwX9dzsPmDn2RXFc9A4
         SJZ8bvT0vPgbA1N8mrNRPAIQL+pLAizHj64RbdzX+hpoJ8FcU0zIby06fFe+fzBPOsKP
         Y1eQJiobRuW68rkCEY0OF8OCZjr/THVQ1KTJzYZJe1hpjk6zm21U1SKc7U+muLHXJwL/
         GSJE7TCZY6NJQLYPmiIR+vw+K+qtFzma8zZdapYdf24QXSTyilypS6IOV8Y4OqVCxI9z
         wwndCblrrnSV5FvbUMGlR6wnlxR0d+Mvrd98cvwh96x5Dvy0STem47WpT1xasQGhmfpV
         avyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240066; x=1785844866;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PH+MS/OXafdOZl+CyaSuL6lgweSk0MpcC245rz5MU4o=;
        b=VvDyJUxioMPuzJMUgrzei67KMuqEQkHBirjH6/zuqKgx+AS8qw6by0c/9rPGC0mIns
         pQjnobXo180qz5c9ycILUlJHP7D16x5GTAhxD2PeHgAvNQFxdZE+EK97BgNcdilqS7lm
         I4g+q7IwNmd4m2TFEXo7EV7NV53Dx7+TZy0v1+XvB3uvkmD6bC89/QujQ070Bq7SO8te
         MfBmT6uRmTgztKqWT/s+evrSV/IxWXGXDeJJ6XgAk6xEV1FYNIj3ZMEI/IVLdnWx6YPM
         hgZmcJzjVk9NkoGb0lLYBzXQ6pgev8ZDqiQlkrFn4iK6q7TKcpsj8fFmixMsWtFOXt+F
         z35w==
X-Forwarded-Encrypted: i=1; AHgh+RqJocQFRQ+sycjQ3cZvSJmzzyYI2FxQEGAOtxsJuemANWZOtedbSsttIyEIF+iTcaRwpXGXuMa85RLE@vger.kernel.org
X-Gm-Message-State: AOJu0YzTqj0xr+SafON9HY/dJhscgx/HR1aeaTbAAMev8GmHBO9TKeY3
	jPsQReXAwjnpqBg1MTPF4MT17xlaBTyK/Zoa7u+1+MtmaQBNcsk7J8LMRyvsVG2qS2WZy35XaD9
	MLo6v5hsfx/0S1frSjopUCO5YfYrw0BlAVVFBJOelRN8f8Vzw1MGBjUVuQocYsixu
X-Gm-Gg: AR+sD10UP+Ve7GgNrjPbARdOdt+7eSozM/pVyqimKoxdY3kRmvyzCoelpmCnrkTQth4
	FAdNhMRMBdXEXWsG81kmsMAHK1rajjMQ/Yz+8Kwn4P5sFPA0pREmqD7NRoCQMLSIGmxCwjNfFTj
	T/Vc754y8LnUf3K05cQ8eZWD8L0Unq25BLT4bDWcBDhdMLDFNU9xuTc104TV305EgeTuKyODQoK
	K+0doseaWvHAdVSRcvDT4tu3ElrITBrrpR3zU3Mz5a7Qs0lckoukWK32fzrx+hEG2WKYp1uMZy2
	9fQJA+tohZHdO5EWuT+BocKMH3o79KitAwdpWiqBWW1lWoMeim07eXEf+MuO+ndW8WL2lAwKanS
	A4WTUCDXVTsYu3P05HlA14pyi
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr10074791cf.3.1785240065769;
        Tue, 28 Jul 2026 05:01:05 -0700 (PDT)
X-Received: by 2002:a05:622a:684b:20b0:517:6162:daf5 with SMTP id d75a77b69052e-529d70f6355mr10074491cf.3.1785240065351;
        Tue, 28 Jul 2026 05:01:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm4137581a12.26.2026.07.28.05.01.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 05:01:04 -0700 (PDT)
Message-ID: <3a8a35b1-465c-419c-aaa1-5d272a1ae98b@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 14:01:02 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Fix properties of usb_hs
 node
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
 <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfXyQsrnA9tdCNl
 29e2wdI7DcUhcXapK52DPlfN89m6XrEngTl/rrtuYWUvS50pq91pM//hAiNMKOqKHcoMMmrvTVd
 F/w2xqP9Y3rnLfEzbogjDXiyKWJry8A=
X-Proofpoint-GUID: 25WXLefC0aXpRiK18xHxQKDOqV2YM53B
X-Proofpoint-ORIG-GUID: 25WXLefC0aXpRiK18xHxQKDOqV2YM53B
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a689a03 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=QLsariRrJL-ENzfB6-EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX7vLzbY7zsab8
 yg46dbiEuALKw8KdSMAU5MB6WWs0vDd0pV0oqWGObiwKSuuQLfP4nz8mdkYKuvm690wRFfbjrNd
 t9Q/OI55iD1qQg/LTGJ+5fY5mlFsaba7+9cApUiaK24XUloGtOJ37ttBCoWboppL1vWubCcP0pw
 +WHsd6CDpdjL5T2EooCY/DelmPQ8rKzap1d75eg3S2AX3Xe5EcgMsZhQez0raHzxpFn6NW16PqY
 otpef6YwR1uV9UKD4jIc1J61Z0Ru+cBJekLtjYq9UPOKIg5/dzITM+I5AbWaTFgGKuxM+dbTBTn
 jYDVC+5HRAw79H2CxHdaJzs7RNBg5go4cZOgkALzwW4fHRVG4Cj2RFaaLrTjMWCTWyQEIO3Q3bC
 mpcBb7gvRECznLroFvP/de2+0w5Jem41LpLdHIgU8Aiv9ryN8a0wiyKDKnuVvStLTwUsL32zcsy
 mMLGhSJPkzGRwm17OnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280105

On 7/23/26 7:32 PM, Krishna Kurapati wrote:
> The High-speed only controller is DRD capable. Hence move the dr_mode
> property to platform DTS and mark the controller as role switch capable.
> 
> While at it, since its high-speed only controller, disable pipe clock
> requirement.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
