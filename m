Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89A53D75A9
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785226099; cv=none; b=c49FJp5ocaJ9BAELsOAbw2CtwWJ4Bx5SX5Yw+wWpNstHX8z8TChvJyF8M4zFwO5Bha6/b5MQ/8Py1n9mjcHbeTJosOK8FrTnNbUiGlrmSXOkS40mNJ/1Uoyu92p9Qtt5fvCBeN8KcUs9O8u6bcCsu0xllmEwZfezO9tRKMqx6BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785226099; c=relaxed/simple;
	bh=q37I5XVI0Q+iLKP5qsaezNyPiLXtMNHajU5etzKIRWY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GuTyUIIC+WFYxsCukGMhf7j5ZBfx40377PpShxuYChapQrsZ+lgY88yV28/tWNs7IsYcoTQYDriVQQVCAerNm4Dtj3qn0ll+RxgxuKaIr/x2CX3CS74/cPgM/wwpnwlKTsFMtRCFfCMyqhsXrr8h/b6CdkwLMDKU1MVVKEQrjtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdX/o1D7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FK7RUKgH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdX/o1D7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FK7RUKgH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81vpm2071259
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:08:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0R53usW3nkPTm2A0goKCOwYwCqYk+4lZv0scDNTk1MM=; b=MdX/o1D7OfoL8HbX
	6wCEsSoj02rlpqkKU52J5RHlg60Ps8R6YvS/USZmoqQBQysjoVVFUiMF9b58/W/+
	ktsQtjwLoB6kQXwVGOLytuNZ4ZXrOFW3u3D7/OhUPKlU/93wE7UpQoWZyynoO59n
	1KLPwm1+JLNrFcrwCwPCnImXhKE51stSwl9h4lsxtTV8ZdApNKANFRCDBLca1DMd
	oXzDNp4fY0kAa1YyijhBuc8JJidNUne3vASoUVWmfKgjN4qsVeriiBFReKBoOGWp
	HhaZdWrPfrvEYmE1PFrjuuonQHI1CXdRxaHiLgx3kpdd+50VX2R73Lo4b08f6n2N
	7YugXw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpqxjg68p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 08:08:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93102454272so16630485a.1
        for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 01:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785226095; x=1785830895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0R53usW3nkPTm2A0goKCOwYwCqYk+4lZv0scDNTk1MM=;
        b=FK7RUKgHtJ8cMzxm04rl6JmdvDDNJfZQpzYzaT6LInA6MQ62IWOBtOsZqKWSDreBVZ
         BBPtuZpUmdk1nuiJzfvZZz6MPF3vVxBeBySJKwD60aGfQXSQz0UrJb91a/RKzmfW+vOo
         D8lielY1dDIet9x4lTKYT/gxybfzVpMG5DRjRgtzDZtC+JoWClFfMMKg2hxZR4laNPQa
         v9dIRbHDnOTyF3NP22fn+GW6PfV5+Eaq8/JgDfBz0dsZ6GihmzZHQ+p+Iwm58V5+bYvk
         875vnqc14AI6s1UgmGH+kUnMOpezBQx0/1MuPG8TMEQglQnQuSx4SffnM9hupkHC2W0U
         wUGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785226095; x=1785830895;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R53usW3nkPTm2A0goKCOwYwCqYk+4lZv0scDNTk1MM=;
        b=Zy6wgD2/0SGiwnZ6KyLSAXqv+iyw1kp1pnH2z67iJm9TAEuurWCJcRabGnMjlauNER
         bsGGv4TNIQX4tfXv/X9vCnDa+tf36GuUdCoJd0Gv1IvToyymmYBMvw6NtJftgtgGPMk9
         t99KPdUByLWakhsyo/gAqTswpruGWNEFlIC+V4jZV9pE9TSkOHtNcqabX9y8e+wKsArI
         XC8aRQ8TtJUSeKPD2vRiv6e/wSCSTZ0MVzHdMUoBUV8vMpKyW19xlyaDtx5kx+RsWNOe
         uBK8npKt6VaJ7AMGJiijlbVF/BOeJ5HLjoQgofFfnvj7zEhvyJQHl39QXyGWOCdBkaB+
         F8IQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUcJwIACUEnuBbQzGieCc+9/TVJaEG/+uQ6dNkKBWfC8aURC02+VE6VQh+i4FkAE8Zky1ZdWeFwP44@vger.kernel.org
X-Gm-Message-State: AOJu0Yyv3HO16Vx495rMkQvn/G9ZzUP7a9Imq6ScW0xkBtF9PqUuedgO
	tgJNTeRjVhtzGC/BxJoUS37KrFXQ6sRYksjL78BgpvSSR+hxpIGIx3NMPjwm4aM9mTHq9C76lVM
	TvryHMZ1YE6oz3IbzJXL99EvUVZYbk9lQlN2Zc4qI8j6gk0cgLPrv1bXp8DXcKH9m
X-Gm-Gg: AR+sD138iPVB11KVCx40YdmKu4MRmWAwcmnOAOhC43b0gwJKoFy017rIkPyJuuOvsQ2
	V/pJRUlezlqO4C6CLYHyb4SQ1Da0MhyOmyh4gU0i97gw+UY2oZUyY32q7QKjTWUOfC3mztJzRVW
	egeqym8IVJVKoDZ7OKdBoQOdHhPbXUWT2G2ATOKX9saZNLkVb6eptBjc1wL547iIHxLCKDY2Txo
	QjZwbCRqisnBluumDXaG9ZMAF0SqdYFs7NKEupX9TN4rAtZ2Nmhl1p+rktGGmku03DwR7aeOIlJ
	S07fEdOVlMS6we8r72zcHD5vF5lFwuBVEjsoAuVdN3Xxk6XyvXQ8IiZvVGCO+a5kMkrf/sR9XdP
	c2wfk6MGGnxCtJnn9gmq3ta0u
X-Received: by 2002:a05:620a:a01b:b0:931:23a:83ca with SMTP id af79cd13be357-933027200admr143515485a.4.1785226095307;
        Tue, 28 Jul 2026 01:08:15 -0700 (PDT)
X-Received: by 2002:a05:620a:a01b:b0:931:23a:83ca with SMTP id af79cd13be357-933027200admr143511085a.4.1785226094885;
        Tue, 28 Jul 2026 01:08:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm720897566b.9.2026.07.28.01.08.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 01:08:13 -0700 (PDT)
Message-ID: <3e5470ae-887a-45be-963f-ee3ab10d36d0@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 10:08:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260728-eliza_evk-v4-0-decc7fe5246e@oss.qualcomm.com>
 <20260728-eliza_evk-v4-3-decc7fe5246e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-eliza_evk-v4-3-decc7fe5246e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 25MO00RSMszs89SbspjJ8VqiV0AuquSe
X-Authority-Analysis: v=2.4 cv=MORQXsZl c=1 sm=1 tr=0 ts=6a686370 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfX9daeR7S2hd8D
 IP7RC2ToiCiclGxglF7pwH0p5WZM+jtBOlj5sGbxdDeRYZjePOtwXM2Qn3FzYIDxhRYLBY6cqed
 nZOXCJxHxBHhzg22+7kEvRIwCmM/gSQ=
X-Proofpoint-ORIG-GUID: 25MO00RSMszs89SbspjJ8VqiV0AuquSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2OSBTYWx0ZWRfX+H5Se+l+2jOt
 DGt40AdRYSDJC9/ZUMWaXhYsxwWnkJdihVol9vqWl3zB94snvH0bQqr53jozO63dawP1NaN25m+
 cmSToNTuMl4anQ1MdIhC6I0Ye/i44akoOmrGn4gehNlqxiaOiOB8izFVps5z1DX2tF3pkoDaTFF
 eEmO09VSWeIBFlr3CEOaKrsOxITs/iShIYvBwsqDxM26Haj2Dt3J08qKuZyP/UztmKYoicmHxG2
 5UbN8iIeHwGU0dTx3MJ5z9t2wh/I/dLjGSxx55cSTwlz5tVEwFmT8NNUj9ALJGhlBPI5KtXGBXV
 xGsNUXT+SGPbd7enEC9jZ2bMHg4yr30MAYKnbXRIswa8wwcvf+tuL/hxLGqsggQaEks6ii/pYh3
 1BLFKo0FAZPJB2HyGj0yZ8TO3hCxwRpM8NoFBXqGmGRiX5Skw4XTD6mwLQuGtwdl2hlYzNlGVx6
 E4yxBiLAbgX+zJEQUBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280069

On 7/28/26 9:06 AM, Krishna Chaitanya Chundru wrote:
> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
> 
> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.
> 
> Override the base iommu-map with the expanded set covering all the
> switch's downstream ports (0x1400-0x1408 SID range).
> 
> The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
> switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
> from the PCIe controller.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
