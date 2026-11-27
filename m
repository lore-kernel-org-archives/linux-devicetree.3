Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785513;
	b=O2AxVxOZuoXrlHTEcf/orz3aaPtMQIsdStLRMb9KUF3P/MfXXBON+KIUUUCBOZnN785p
	 X0dzRhxWqStwL+Z8Sle3Z3VUhuPXTVePj51pO78DtuDWeMbku31G3O2wFCVtGlw9JoKGm
	 kVqpAtEqKalWCgv2wK4c1C+kS/KWM1sGbinAY+rL9d29Vm0oh8FxjsZhsExBydOklsxlL
	 9PsUiofcoRJjL9uASrVb+1ttnmQREB3f3eFYL4tOGiI1TIUgrUSnz8/fYPZAbOIPz1cYy
	 KObl5QqA9Lve+XrRyxDCXugXWF+lev/wVVtCBjy/X834pfxo+TB7VOBpCUQ4lbm5r2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785513;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
	b=u1xliP6LxMWl9S7QJ/+peHvRo9mJtPmGzT27qlVBbygTDqCjSolceAwe1ozRkfOiwFax
	 ZZpwHtdoH/KBe919yq4iTTxdCkhxyk9PIvt+vhbLoSeK/5f/j1tsde7vpKMiU4IVog0N+
	 yZD2Sb7oDp4csfc7i4smkVa2YOse0kXvHLcFgcBGqQzxJdRaaFsbrZAnV/Q1N+47MyOSp
	 27tCcEW7B01PQ58IljziQ7Y3z7k6sMfd2Rl8LkdyDOK6sIO9GfENEq5XqzTdXyWyk08Bn
	 AAvrDDcirLY+8M+OY95dB3KSTP+mRycR09cK6+dIonaQCmwVRSAbh9XGTJ0XJupCqkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p80WorYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZEDsgZR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46178606A31E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46178606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=p80WorYI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZEDsgZR
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARChIxD296663
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=; b=p80WorYIro4ohzW2
	n7G2va8lfGKKOkZeK/aPziA/M/Oyv+ed4E7+40KYRy+BHTfPlETqTg0EVi4MklbE
	96bVLwkXnD1G7qHYs5TtpW9m7BFckXMwOyjpVuBOoKWv7bRhgw2XP2KlE52/HsUp
	ZwTtRzqDRN0KfHefjrP2LHl5nzag11ejIOGmPxFrwV9KznijZRw1L6COLByObHyo
	FWeefEiy8r1JqDhEAeUHz4i8R/OuzVhtlcHIykNHOSL2xgJ2v4Z2b3Eop0SVtEeu
	dZlXZbKN5G2GyrVyRNqKVXckT5K+ZQkO4KeFHfhkRBsYxVm1t8JIbVL6iHh6H7SM
	cyAnMw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6sjsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 13:18:32 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7ffe90b2cfdso2829001a34.1
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 05:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795785511; x=1796390311; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
        b=WZEDsgZRFJkMaMpvF0QTewBtzt3pcETbMpw179xSUzM9xw95bf7e2BxbASAlz09kUd
         xKHI04E9i5nXGOAt6r1z0fkusPZHHhvMzBRqsiOfogmt0lxOdnV5WhBMMJSI6Z/57qMB
         0SVfznkiIxzjf97Z2zFZG707cr07ftqESul3ZA6rlTjejPJhAT2c5RgKAq722VPRyF6M
         9VHJnsMYf2CN73jTMqI/j6a8e9fiNiDmHZdAoVK1BtGM3ohH02IdDMJoaJAJEG4c9huv
         Xh7eHTiAKI3R0YlANv/R1BnzLkoj9HM2B4DDKhurpkke9DQ2m83o35fmWQBAxPvzIsNI
         UwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785511; x=1796390311;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GyjZ9OVxjWleGjwvAkve5HzSuA11I1Ws4wIx3h3zzVs=;
        b=RCEx4EIFro7jdsHO7RiPTr59cffJXTFaDXUobCgk4K4Qg2Lo5tD+FRehWTfWHUfmOH
         aPcFhYWYTkZts3eb6jASUwj7Q7q9QwHa2/P5ZP16hBPL78F6HpkCLiYZT2HHvwud3ttV
         pd08e0PtHIGrHS+LQby6QqBdQjx9ZABHd94munWwm7Lz3FVmzrRGO6Bm+iTTLps49taN
         RNsX4JhFeelXbiznGuEJwWPWiWcyg0vuZxhNIMYLxH1mkgoHSODXOMzu+Kk3HIMHg7Uu
         WB31KUAwldRP3m/onVeTSFmHp/kShEKhFLqEPAOTGaBbElP/Jkr//mNpEDmn7weJA85w
         qLBA==
X-Forwarded-Encrypted: i=1; AL+hErEd/ZBSujgehKRKLIxuzDyqs9j77xD1TBIVHc4v/J9CqIk58YGVnOJielPZ29wOjlE5V2ZuAyOlLPdP@vger.kernel.org
X-Gm-Message-State: APuU4Z+IxZUVrHiHakNSXnHOEMexSA+WwxnqN/dKJ9ka9hTvxrsdU4aB
	cJaI1FnBvPprNT6rGQTwrnrtJPLydzp6ctieyPQkifGM8zpdZakvrT5AC6AIIIv3C5IrvLQDRmN
	qfFDap9YbZGl+rGUoijgqkVcoC/XKR4g9HNs1Ok6HMDUr8upWa21BHYUT7fa0TNFl
X-Gm-Gg: AZFdTZcMKIvb+KQ1fpw/MbV0um6iTzu3x2YGWetTB4P8F5IPgYnPJ1ooAbcBJPAoeGL
	iyr+EpUb5AqXvPbyyAfBnK2J/KT/UkRRYn51GNuBIoJfnBANOMxsWIBA+8Yl62XoLwV2pEsCnhb
	JkcgTZfwFsvirjPeIp2JBkYHt+IIwQRf56eN8Ru1h3RZqE7AVa4yvOIo8gAmiq6lqfJXvV8z9Wr
	jG9y0I4FBy0vBCuirLwnGQRTVRRQjUcM8tSPkdaSPKGe8Qhpndq0bClRgH7Wbu2AOTElrllFEco
	zWAcMoxbxA9AwYPuO1TNPzfLno+IMeQOohx2QSyC+grOaDMsH/0vItXRkXgomwnXd7RpGHW8gv8
	Z4VuafObcAH3AoKhEx7ZSJ0De2Iu6dyMerrCoqSyxgSbgarumdOPpZT6uB3wnhlzV2zlJF+Y=
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23721622eaf.0.1795785511353;
        Fri, 27 Nov 2026 05:18:31 -0800 (PST)
X-Received: by 2002:a05:6820:c2c9:10b0:70c:bf79:3e6e with SMTP id 006d021491bc7-71b39033ddbmr23721577eaf.0.1795785510904;
        Fri, 27 Nov 2026 05:18:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba36e362bdsm11167573a12.5.2026.11.27.05.18.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:18:29 -0800 (PST)
Message-ID: <26b2413c-c705-4ed0-be25-ce5ee265e395@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:18:27 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: glymur-crd: add DisplayPort audio
 DAI link
To: Rohith Chiluka <rohith.chiluka@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105104657.621104-1-rohith.chiluka@oss.qualcomm.com>
 <e24d7d8c-ee7a-4a83-8daa-4805a7920f44@oss.qualcomm.com>
 <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <52890e46-95e8-4bc4-b2f2-03aa059b59a2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: B7u2efNT_Ztm8t6WOdcbCkC510C_ybrt
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b098328 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=T6v-2sJnNWr9hvUYHbYA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1MiBTYWx0ZWRfX0dF/IKLp3MV7
 W8tyrdisaaVIopawTa8uUo6H6I1mkDshAMkZeU1wTgQEnr/5F204xKQz6JzEdn1YF6CpUlfQces
 +tqADKdrsf0HUE69QqeDqyKLD5xXUP8=
X-Proofpoint-GUID: B7u2efNT_Ztm8t6WOdcbCkC510C_ybrt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1MiBTYWx0ZWRfX/hVP3o7hm739
 FUG3JCREElD1+De0pGUu76h7nDNRIux0TC1mvwhiPMbAdiWTBEcrJJbekJIRoQIHegJ403R1K8X
 XRFoyym6OlfsTATUtUDnaZs9vwFHaRZxLmU32fksCeRjY5R/EHyRwmOGYZpLNZCPpomLNl/rkmF
 Jw2BG9U3lNpo0TqYFP3u3A08EQTsLpM4/xrt1iVm1MfGHrOMQbOXQzXKa35WD0FZaFpKz1VFZNp
 pbzuQ+88MNVvu40t6MpmAiOtrZs3AbyCLrGmawFbY/MfE/ABwqu+b0f0ITRyoWiLrUp5ivHgZOL
 +fOjuqe98zF9KZipLLeCBMRiT2LPxyn8gzdgbe3X6xi+rArYsBpw1MxMVxg+XQCa/D0tl4RJwao
 gEgSvPG7lCt/3fKGqfDkw/FazvWWK0WZNf7KrPOcCDmAJ1M9+qwsTkOhaERZMFfvirZ1Y5YX1yM
 P2DDSuqJNiFWoSnnJGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270052

On 11/16/26 2:24 PM, Rohith Chiluka wrote:
> 
> On 11/5/2026 5:37 PM, Konrad Dybcio wrote:
>>> Add a DAI link for the DisplayPort RX path so that audio can be
>>> routed over DisplayPort on glymur-crd. The link wires up the
>>> DISPLAY_PORT_RX_1 backend of the q6apm ADSP to the mdss_dp1
>>> controller, with q6apm providing the platform (DMA) component.
>> Why do you think we should only have audio on dp1?
> 
> This patch series targets |mdss_dp1| exclusively, so |DISPLAY_PORT_RX_1| is used here. Support for |mdss_dp0| (and consequently |DISPLAY_PORT_RX_0|) is planned as a separate patch series to keep the changes scoped and easier to review.

Every patch has a fixed cost on all sides - for the submitter, the
reviewer and the maintainer (as well as everyone touching the git
tree afterwards.

The submitter has to do the work of committing, writing a thoughtful
commit message, ensuring everything is in place and then finally
submitting.

Then, the submitter sends an email which reaches dozens of
people, actual humans, both as direct recipients and through
mailing lists. It also happens to cost machine time (which burns
coal, gas etc.).

Then, the reviewers have to receive and read the email, analyze
it, check if it's right and leave a note.

Then, the maintainers have to pick up every patch, validate it,
build-test it, perhaps run through CI separately, sign off on it,
push it out and describe in the changelog.

Then, again machines have to separately process that on every
step and on every single further git operation which now has
more history objects to dig through, wasting disk space and power.

By manufacturing work like this you waste all of these resources
(and on top of that, each one of them has a clear monetary cost -
be it utility bills or workhours) and you have absolutely no
excuse to do so.


In meantime, Srinivas submitted a series in parallel doing this
work for multiple Glymur laptops at once:

https://lore.kernel.org/linux-arm-msm/20261126183806.172485-5-srinivas.kandagatla@oss.qualcomm.com/

I assume he didn't mean to one-up you and we normally take the
patch from the first submitter, however that series takes on a
larger piece of work and we'll be moving forward with that one
to avoid cross-dependencies.

Konrad
