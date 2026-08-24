Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B890E3E7630
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787561838; cv=none; b=Nr9RfaUDAXMgq2MjEX63hRqJjIJwUO+RjtbBSik+V+a5JpkptDRqTmeD6leWAmqFRO9BcNNz/CulteBEJV8qMj+XeZdljUKL3w7NtSilkay4W3z6tc2W38Ch6V0CbhWOul+6a3vEBXjILmT6dUdrXaAEjzF7oa1swmYzDeyB6/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787561838; c=relaxed/simple;
	bh=n/O40m2GZ/yzb5oqxUkC+dBG0QysdnWonyA+OmACEtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jObXOrVArbSeL6rR+m69P/OMaHpUhVujL/OTrEbmrbHgiNn3glIH+EfZxOfDT2dqzT6OAvcwzDFJ19npj9WaV6mvtkCT9tU/Dxhvk7iotMVHhP5fqo0lLm1NMtesJ1ibjWz/dMUE4ELm1BEzpAIvGAoejEeSLLBnyIQ3rQ9Ehaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gSTvfiCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E4VnZqaK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gSTvfiCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E4VnZqaK"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O67e7u1662625
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:57:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=; b=gSTvfiCPiy6tBTT8
	H8xD01Dvexde2c9yveBahOyv+6rWc4h6vR4tVDiWFdO7sbDVLYVUnupFrNRGzpE4
	lHBSyHqMcQ3r3fo57LBmJL8xZrrxQZqs9URJCUiYYSHjS4nzhMsBNECoro8hkZ7T
	KwHhkn3dTyYiu2sJvOF6ZpGjr0GcW9EVMN891cxQBZpkkyQylhCzd6XUYim6/Py3
	ishbu7qmKPJKdZHtFCCY6O1XwZpw2gGqc2bdSjP807BzmGlEkRvo+LRWMS5qOraL
	gyZEONUUALUaSbrUfA0SCGOpI+AQaPQ9BbqGskZSlsmgucNXR5Is0ImWUYdlOLfy
	Mbcv/w==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8gdsgqs6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 08:57:15 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97c7429029bso25706241.3
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787561835; x=1788166635; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=;
        b=E4VnZqaK+UqwbHYSbGizgyLqfDwCMG1EjkNW8+ndYa9b0ps7fET7TilPsEesfwFUlw
         HGxMwGVPv+OJnv11wYYVISK36nCIvI/hDToeWyx03iijssVoVouVvPUUhofVUb/3tUmo
         6K4Q5G0jyk9kzmp9WchRxfhQpPXV85eqYnRWPY9jZTtECpve6qvK7pqRhnqM8HgqYO4P
         BcpsBUSPNZB6lcXknTgyH4viZKkN+xPfkH+vmgJtK+2FnqSTI5TTHNvjWYNA9UhLdwXj
         1+g//RlYEyG550P51EJV5IcJl1yekXLTBSY/RNVcAO+sAAwEsdrQiITPJj1Q1natZdCz
         lvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787561835; x=1788166635;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FediVK++eWEGtqNNfanEj1qRZ+5vZO6tRsceojvl3NU=;
        b=VRSarz2epuq/xOISXgVwesvvQX9P5uMFV3FkLmHeRJ7SObgaqRB8u/yNWV/7GMy078
         NZMcu8iMxSqZ/GLNQzjK51mJnVeX1we969IYWqJLUV0EdKHhtKuIczRj4hF2MzI+DvA9
         1Il+Dm3nZDC+oppgFkEz8/avQPhFNrc/3OJMtKzmG5hKFkyNC0b7aSoYFLh8FklC9eSO
         OKuU/rPnQMtpQ/4jC8lFSsRbixf8S37cYtvcBFXOgHkVlB5XD6ywZZVfLqBNgBIezNxN
         9NcIB2D5OfSdssTnR+MmVfgaPlBeUp7frpfnK4ZKo9tG0WyTakYa9/rrWjZkXPPv8+iY
         KPVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq/6yZ+0o4qw2GgjiOif+sb2hP59G2STlbthiu3f0fbi96bG2xUy5E6YZRJaVC10Ejx5UAgCqJTTXUR@vger.kernel.org
X-Gm-Message-State: AFuF++nTHZhqJgpw5Gp/cOD5XFqMqnO5Ziljnw/kIQ6WLFY3tuO4ChxU
	mfyz1zT/UD8sRApnezH6zqV60kT0w7iaTvxo77A0+7k6n8ITyakM1f/FTIBhZkkf5VIsxkF82h3
	X/HOZ3NZ5urFNGcdm0hAu2yOGuDj5eBKJER7fc/MG14ZXXBm56JoCSC9hdNXvMbrK
X-Gm-Gg: AR+sD111A412DPb5CptraKPdlrT2gICPwNkmfMiKAHFXan2I3WqbIlpc1madzCnoJvd
	3ZBanCygrMtUkycZ90EsyCw/Qb0lFJQw7oEpYDBbkqDnNAFokrtC2FIuAEQ9rau6LvF2uiODY0I
	+BUH1LU1vYgbN/Xt1PEWdOput1f1fafRGVmPYwbMDC6m967KfTvS0nSMVdxwyoxCUUZsOMB+RqL
	3kH4EzIlflM0G1pIi+NEXM4jA07xNGxFIsbsCoOtTEU0B/f+e5G5rfC/LpBchAG8zI4ro6jAWR2
	JFVSA3ET1j+O5Zwnru/coSmDbFxebuYTOghzlNecSuQN7CpZWubEOSe3SIUy0FiGMMIBzNKVdz5
	vQscwzjaCbZWEYLX7nXz58xnF
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3515308137.1.1787561834940;
        Mon, 24 Aug 2026 01:57:14 -0700 (PDT)
X-Received: by 2002:a05:6102:6893:b0:74a:b1ee:e21b with SMTP id ada2fe7eead31-77a643461f0mr3515306137.1.1787561834572;
        Mon, 24 Aug 2026 01:57:14 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e2ddad2sm7355677a12.30.2026.08.24.01.57.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 01:57:13 -0700 (PDT)
Message-ID: <0cc4dcb5-cc90-46cd-9174-029416e7f51d@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 10:57:11 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: qcm6490-fairphone-fp5: add
 ST21NFCD NFC
To: Kristian Brox <isyourbrainfoss@proton.me>, oe-linux-nfc@lists.linux.dev
Cc: david@ixit.cz, krzk+dt@kernel.org, devicetree@vger.kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, luca.weiss@fairphone.com,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org
References: <20260818205940.1973944-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-1-isyourbrainfoss@proton.me>
 <20260819210906.2500789-4-isyourbrainfoss@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260819210906.2500789-4-isyourbrainfoss@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: cDVgnky81r69gR51wCF6wbi4QuMnDAT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfXxVBmeP6JxEMm
 FPj7SW2tluYoLLrxu1YpvQVAx2FV5t8VupYpD1kmUkIeQa3ywe6aTn2JhGfMBYdOay8/sNw9N7T
 jnxjM8FjM2zxkY8Lsc8zy2ocwZW5Kh7GMNRy/Pwodn7PBsqE0aZVJt2WSXJvXYcLUqrulZvyGit
 5C0J1/O93qA69V+TzycIjaTpMmD2ViHBcoxmrvMlDbrQWDX4OOp5FBbCh+uuq9m5oSiNZYvVDFN
 kvSRzoW96MxHkyJllMOwWOTUuFNbOwqNA1I2dYkKeYeOllXl3TFCmvT8+O9l1jw67nvja9VRfSu
 HcnxEa3JgvEfL7cFXWWcRiSP9abveJd4zGGDQf9MZbTxb6bcKH00/mVmrdjvniZukLr4blRoGS+
 Bxlha89wpnzbkDXRk6nb4TpDLM4akcKfwnV+9VhMMw9oOJ0xo1LspAwzdd1rhpiHcpT2T6eDOOc
 U0OJHkUYJTlhZfGdyEg==
X-Authority-Analysis: v=2.4 cv=Fqo1OWrq c=1 sm=1 tr=0 ts=6a8c076b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=FWA6L-ytD-VELHUIOsEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: cDVgnky81r69gR51wCF6wbi4QuMnDAT1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA3OCBTYWx0ZWRfX5lvGDyD5Efgm
 PdS6HfI4c/qecRrFgbGSr3cHjhOoH+WjhM1WmGFn6vpCYZFALN+LNH+vIXVF/FhEBoc7hJ5ho4O
 jDfWYrFIKa9W+RD4gGSDPGCAwBmxLXQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_02,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240078

On 8/19/26 11:09 PM, Kristian Brox wrote:
> Enable the ST21NFCD on i2c9 (0x08), IRQ TLMM 41, reset TLMM 38
> active-high. Compatible is st,st21nfcd (raw NCI).
> 
> SYS_CLK is LN_BB_CLK2. VPS_IO is L18B (vreg_l18b). ese-present and
> uicc-present follow the public schematic (NFC_SWP1/SWP2: SWP_SE to
> SIM1, SWP_UICC to SIM2). Reader path is tested; SE/HCE is not.
> 
> Signed-off-by: Kristian Brox <isyourbrainfoss@proton.me>
> ---

[...]

> +	nfc_reset_default: nfc-reset-default-state {
> +		pins = "gpio38";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

This line is unnecessary, the driver should assert the pin

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
