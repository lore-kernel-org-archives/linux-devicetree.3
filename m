Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7DA1552FD
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782198418; cv=none; b=L02MvFLS02vFc7/Z/QN3KtPLBaoJYzXyKt4zNR7le61sKCdHUajtj+Q6ekLGKztH3kDPvWkUsIv0cuGgE/HyGTvIvOm27l3g472oQJyA1RlPK20JrCLGJ57+1KIzHwISv8kES7pAYsGt3Dy7JKQzIPh3RENllwWYPXPqdJdAAWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782198418; c=relaxed/simple;
	bh=ntmtQ0NOfdXPuqhAE7JL2TnPpPE5mcg+Phpyr8HOVCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dii9gb1Gaa5B7d6NMUb4A1jTh9tB0LvADJu8JyqlesBOoeV2tiunGxDlrcxa3j6AuUq/1MwpFRv6eAtqaW/BbaKGvxZGDR7y3BjjcKvxDIH9ejIK03KRdkzOZsk9P8jpq//S7PvFSAATCWNgJKg8NZgEMCtBEhFrDHa1sspViL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D+2l+eLx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfNaJaHr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D+2l+eLx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfNaJaHr"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6ckqP3564056
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:06:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V4oZvsT2Nk0+0HN92sI0UNWybZoEa1+GEhonQrC1CrM=; b=D+2l+eLxpiGVPgaJ
	jx/x2idHo/APehH50tD932IjyLFJaCiMHtZbvZm3QmLDO96x404+rghaXLqr//yq
	xkOF4btjJe9M3AfsDHFGoVbCH1xj8sF4UBzZ4qN/3iJIDTXpzKnN4rdXu/NU/0rr
	mKDqwGiowSenLZbN0C4BH6jskvzU6YNNiKBwSm31t6F2pxNxgmXocIFMtzViaLgQ
	HZNqOp6/TAu+wdOdMvI73lpzrRCmketJQZqVzL73gIkdl0iasixEDO8XCxumZjL+
	lUEOBFvcLXYxIbvy3KOESPQE/QnAUrAiHnl4m43sUX68Y94CmjpI1VwYluiQMADF
	G3sj+w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey5n43f68-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 07:06:55 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8d37bc61dc2so2722166d6.2
        for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 00:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782198415; x=1782803215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V4oZvsT2Nk0+0HN92sI0UNWybZoEa1+GEhonQrC1CrM=;
        b=LfNaJaHrj4sagUvK0ynDjG2QRu85qFuQbG41jL5JMnCAt8Xn1JH0IWJTXbkdmRoN2v
         anAgAiPCjeYvNb+fzGIHcQwQUMB4L+mRlsQdRf9PkxV4AU/iau0vQk1aA76+chmZX97c
         rWoaHHFN5FpsU0Bb4sK6h3zHUxKCDhdqgrDXRvAPbnUqDX27O+YYFPUC54p/SXXkeYID
         j7WMa0M2giD8Xnrg3pybpX7rNGOeAwnf2DhR4pH8FRV6KFvjepcAEoQy+kiK3kAR0wBy
         K6KampRrZVFXHRb38DlZZMz3STZ5s6u0TFRChV7JYzRw0v4spmPU1vqo7agGjG32hZJi
         Ae2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782198415; x=1782803215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4oZvsT2Nk0+0HN92sI0UNWybZoEa1+GEhonQrC1CrM=;
        b=EkpNZB1xKoOg/B81v2rGUt0UQVSwkMiItmOtc5myLSepGJ87rbUy6CiuxnRadTy9yA
         ZWRkrzdJMDjPPiqqLmPHJuFy4RItghgT9DTZGstwt9assoiceXlGh5pITf9ghsJHm+2p
         ypUv7fXSwtmFn8D8mLKGZEOhqfcMG25RlxbAvtJIO+U0rpnBRx83MF5JiEl2VweSvNGF
         j9L6MBYoTGD2E6GB5rOCLBi2Bpak3bcPfuv7rPpR4zYaI7jbv8j35ozTACoLcV0QyjVK
         D3rCzBRArwab6lYd9pXfusnaadTudbv1U04+p8CBgZe6WQ8w7AcFQSv8c4V3AhHrA+61
         IOXA==
X-Forwarded-Encrypted: i=1; AFNElJ88QRvHWyrTcXTyY8D25IeQuvS/pks5n5TSov94zFAgoCbrV+jLME9ql/cmhmN/b4aLvmRIIeHQwgCS@vger.kernel.org
X-Gm-Message-State: AOJu0YzK1w3BJZRRZJrLS7tt2ntoflFfvLfK9XIpXLP7b44K5fMN7hoy
	xyteAYRucZ6vdb/kePx3dZhBgX3IgUDvaUzOGDwBzV91/Ubwfz0w9MlYoEN7rcmx6dkauj3UqjX
	zeoQhb2BprzOKm5LvZt5QBuFRKIImpcthD7wrp3Zr0caFWfPffx8/w6r55FNKGL/R
X-Gm-Gg: AfdE7ckaCUaYIVxvt7AWTcmupdEZmtTu96rj+aeZ37pN46DvPqNpO421KaMzMukQ+Ol
	jqn4zLLyzgtlUwkjskNbYGmyQSOck/ClsykEahblrB4BhhIQInlWTjUjbhGxpHCoVRJILNhlpDj
	jhy7QohKF1r1gt+4tDyHwpPtoC8MvOb1EYKHszyp00jI3WLbGFRJvSXNpcU5YnIkJgobRvd1uVb
	vFuppr5FkISN643uGBGf5OY9ak9YQ45CeStzw24B7KDWXYRviEp4PdJejilZPqpkajQ4bxtFnDZ
	cNyQZLiXtLo1KC5+8ixJfLq1k8iOMxAmqprCWJqwDIFkhfol61NxYGAhyslTZ/eKDbUZgNuxLDS
	+zAmJviNPuoOgiD/jKsswqO8uvnqgM84ckGA=
X-Received: by 2002:a05:620a:8808:b0:90f:7ce2:3019 with SMTP id af79cd13be357-92186ca0326mr1374830485a.7.1782198414742;
        Tue, 23 Jun 2026 00:06:54 -0700 (PDT)
X-Received: by 2002:a05:620a:8808:b0:90f:7ce2:3019 with SMTP id af79cd13be357-92186ca0326mr1374827985a.7.1782198414302;
        Tue, 23 Jun 2026 00:06:54 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e4987d8sm466707366b.9.2026.06.23.00.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 00:06:53 -0700 (PDT)
Message-ID: <fcb6579a-4e5e-47ef-b9a5-009dd761e4de@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 09:06:51 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add Asus Zenbook A14
 (UX3407NA)
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20260623-zenbook-dts-v1-0-3f80f680381d@oss.qualcomm.com>
 <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260623-zenbook-dts-v1-2-3f80f680381d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfX4FiaCgfZl7wK
 1HmvesF72vizTX184swi7ukQXUF7FmPsNd++zAsQJkRrgKQGb5qFpjfBnSbQFfTomnxD8FOh9Ho
 /5EMNvw6BChyvmLDNkGDfZcEjKLtMy4=
X-Authority-Analysis: v=2.4 cv=R8Uz39RX c=1 sm=1 tr=0 ts=6a3a308f cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Omn3S6Sier9Mzsz8H4wA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: PDSoeAobttyM1ysEN86dDcvczMVDD0uH
X-Proofpoint-GUID: PDSoeAobttyM1ysEN86dDcvczMVDD0uH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA1NSBTYWx0ZWRfXzCuB5XpOwprV
 jtoK5K55N0/HWMoFjJujzD9NcnEmqn7/tn6CmZbBahpEuiraedsZLGDd5KJwzDjoPfeNuQ1PCuN
 9f42qGpTfFw8kr/vINnvWfvFYJ/Lr243/Sthahi5QdzjJjBZlmxfnA4S93G4eiOsWm67wJxNTTQ
 66ckAYMBH0qL9V62CdcrYEA8qp4vg4a2HZHgSjKmvK1wtT0VRW9AQRm92TwYTtXQE/Y2Ou1Dq8L
 vs+krb3+6CcOl2TizQnZtXiclYdo+4kkm1zojrGHf3d3/tdF853FBSJUmia8Jik8v2ZeFMlW8aD
 C9NlzNeDyr5B8RwPwwVIXhWp7S9xrVU2NJ8+lzv3qmMlKfh6jlinnbq/6f5ehEctwfTr9iXtm7V
 ZEheP445tCn0W2ExqHnKlJN+rXX4jtDdAqbBRC+oBP8/YjMd0ZsNB5Cow1J0xxZtL0fLbc8Px4u
 u62CRP5IoE2dVGWY0OQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230055

On 6/23/26 3:31 AM, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> 
> UX3407NA is a variant of the Asus Zenbook A14 built on the Qualcomm
> Glymur platform. It comes with an 18-core X2 Elite SoC, 32GB DDR, and
> the other typical Glymur platform capabilities.
> 
> The Asus Zenbook uses &pcie3b for NVMe storage, the screen is WUXGA
> OLED, it has two USB Type-C ports, one USB Type-A, and one HDMI port.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---

[...]

> +/ {
> +	compatible = "asus,zenbook-a14-ux3407na", "qcom,glymur";
> +	model = "ASUS Zenbook A14 (UX3407NA)";

unusual order!

> +
> +	aliases {
> +		i2c0 = &i2c0;
> +		i2c8 = &i2c8;
> +		i2c10 = &i2c10;
> +		i2c19 = &i2c19;
> +		serial0 = &uart14;
> +	};
> +
> +	chosen {
> +	};

Do we need this node?

[...]

> +&i2c10 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	hid@17 {

We've already got touchscreen, touchpad, the keyboard's below - what's
this one?

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <4 4>, /* EC Secure */
> +			       <10 2>, /* OOB UART */
> +			       <44 4>, /* TPM */
> +			       <90 2>; /* TPM */

Is there no EC reset pin? I wouldn't want others to have to open up
a laptop after trying to find out what it does..

[...]

> +	ts_default: ts-default-state {
> +		reset-n-pins {
> +			pins = "gpio48";
> +			function = "gpio";
> +			bias-disable;
> +			output-high;

You can drop this property

[...]

> +&uart21 {
> +	status = "disabled";

hm?

Konrad
