Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494B33EFD21
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563652; cv=none; b=FkLbZrglMTqXVhY4ooUElMOEtOqeP6WbI98L4iKJAD11u2zaDw8Kw6Gr/urPnLRsxvpMNSWLvxKZUxz7+yNBCHR0uyt+Jx03E085fJDUFQ9Qa1LFhriTadUWIVQuC66bsX3vY7Kon2RBRrooX/SFgB1hZv6Jf9x2JwrtofxWjj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563652; c=relaxed/simple;
	bh=K6gEvXZ2Etud0O0icHh8PzWAW3SMPp7XO55uQExUCaM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UIjqU2e2rO3uJRxawAyRSi2x8O/lRhr9OB5YA53M5a366qN/IqfAOFXF/LrOkhqJnrFMYcFR9uiVcVmycPTKZHY7ULdvaFjBTnbvmjAUHLnQG8q628WDd1ZquOjTg4FbqONcoa8flP3x3KkbGlpOOptcHqyRrxO0f6m6Z4e8byw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nd01eUms; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AFpmYb7R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nd01eUms";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AFpmYb7R"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O99cSN2572096
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSL8qk23Y7FEh/hAbYGDIl8ENh4eyRnJwA85sstD9kM=; b=Nd01eUmsJ1+fHFHy
	k0hyQ2QJaRDGEDMBAYbegqBbpr8pwRQYsbwImGnrpJrypz0/72XEnkwH0w3kobK2
	wIgK0uqxD6fIuueakKXfwH4Vk3XUJKu/bd3TSYUVyT/urLdDQ+FgiUSvF/5cebJE
	5ksCJ68/5mMJJ6Qgbu++JLrDyQP3l+RCaV+2gXrciXffb2DRUCkqDxetVGNooVF8
	jTUOG0myOVvNbLNxISbPAJNb4KQT5eVEe2Jk3jHN1YPvjVgFYyrCAj7SWsCUB7D1
	xRdGkEjpEBywVU1hMYY8SdJbyyXbZGZXfsMhnPm3GWl1MoHbr8rqAieaaxudA4ax
	UhApeQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8bdr1suu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 09:27:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ddb567146so6930121cf.2
        for <devicetree@vger.kernel.org>; Mon, 24 Aug 2026 02:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787563649; x=1788168449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MSL8qk23Y7FEh/hAbYGDIl8ENh4eyRnJwA85sstD9kM=;
        b=AFpmYb7RqygFY5lVsUtP4M+WjCNnjyxhp+xhKVIyXjWyyX2Md558k6Xv121S0FtjNM
         K9W1e3XOWEGXk7O4ptGOyVhMqtMXHLnkRsICqC2288+oAdMx+KCVhXq9oSLLQpxEMfv6
         eHTOAAH8HZVBea4DIX2vnB280//cWwsos/LHWQuih+mBJksR5CdBU4VYZkgXDDM/D3DT
         yqsGuLUc/5zXjA/0XfPP29Re8u3teSP8dt8ogKeLrDmnG10q1ukR7Uja7BKFCuRAjDDj
         Nv1KKM9IsjdWu7ZcUbeI8GtXGLa+daNN5IK0JCnvtXQMXuYtVXDCZ8OrqRd7brt+EEnZ
         SIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563649; x=1788168449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MSL8qk23Y7FEh/hAbYGDIl8ENh4eyRnJwA85sstD9kM=;
        b=dYHg53USSkOoUWVn45In9B1NXrI+FeqdLFMtRAvuTQCet7bqu86ewX0Y60JV+xA6eh
         sVv2Yf96zdNqMOlgMuqQaXmJpnBCKieJPht7Z4InzGictQ5YUpI3T2v1DOEtoFGlSryq
         /mXgRQVh+bpI+qtr2FV2ju+H4GbgRfDdonXrc1bnEqch7Z2BVVh2fl2jlw+jXjeQxoUs
         rm27AwRY+b4e+hIHGl+oZpreMqOlZUHqMs/FQe1kZMq7xFffXHvlbY5m3WbXUz7nPRSS
         WEc92qEtK1owkVRaC4cNLZHF6I3eWUhwU2ZuUEiN0b9zcY12es2iZVrYRJtP1trNlMWV
         OkvQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUIO7tGhtxxsVAzb46k1o/FOlIUwF5Uy8ertmsrSWo+31qg+NZcT8tQ6i1BERBTZ4CFQtLZnOi19e6@vger.kernel.org
X-Gm-Message-State: AFuF++ni80pF5t5pPxCip8RtiKdWfwfGQex8Zd7BPak7+ulX1loYqjmK
	jL2ABqND9rl7VavkgrPUSH6dKkhB0c0RESWkLNT1BI9MWtpyaetu1QEog0crGx0kmgIMAaS7UqC
	K1SEtDdCBk+vRFzjWRiMmq1oh6TlCTOEVpGd01m3JhZj9pdYzdCv3hbwJAFVfP7f8
X-Gm-Gg: AR+sD12P5lQYPBJDNRSBnjDWAbuXeTm+EUGID4EijKWNqWy+z9NjhdW/X9L63smNA+B
	8zJmmYWice9M2gAi7yKaVM4YEMO65cwjRxACkDPaH2q4KBf2JKPVHLqrzXcea367IzJ1BstQjYS
	duEq6QlixxFdudD63/aF1l4rahJOOecSS93x5RurI+N9vqKtp14YgweakPvnZN7PGu7qqS62eXz
	RwQSFcQpDIxtVd/8fxDENZBt8QHEO7gVcSjkQX1LQk4PpdjZ9HjSeMg1ow8M+qR02K/y4akHOas
	R2QrW4SXU6I9OjmwzHarEkjhNb5I//ZEcinCS5x8yGYs/xebqJFI8ipegVcB6Wsn9bdrhRRHNuP
	cPRbpZO0jdizAGBRc5SrnHSN1
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr182010251cf.4.1787563649595;
        Mon, 24 Aug 2026 02:27:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1102:b0:528:3722:a372 with SMTP id d75a77b69052e-52df5a21c48mr182010101cf.4.1787563649173;
        Mon, 24 Aug 2026 02:27:29 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24966f6ad2sm1177123866b.30.2026.08.24.02.27.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 02:27:28 -0700 (PDT)
Message-ID: <7334c260-0130-453f-8169-c07a3145aa19@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:27:27 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-sony-xperia-tama: Fix Bluetooth
 UART pinctrl
To: Shujath Mohd <shujath@outlook.in>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <PUZPR01MB514105672CE6BD050485EEA2C3DF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <PUZPR01MB514105672CE6BD050485EEA2C3DF2@PUZPR01MB5141.apcprd01.prod.exchangelabs.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX0u7KqkNuwR4l
 25O7eSMvhIMZG3hUjnvwPwsb8+X52nhK134X6tGozxVRz+1CzNGyjbx4oIb8nPFpYlubToTd0Bz
 jXiEJity+nR73rdPL8PW/IkIeC+2KsqYYNEwbmWT7Zsj2smm1xiTX8i4HJL9kIOSpOJfZXwl6ij
 30mpCB0GVooD1oeutUm2HbO8XfSGM7E0rxXwa4HNuhNLommUdxVQ1HHXPRayASsnOpLradR1pUm
 UDqvUGTYjFKGlRIIn98Zz0kfkK8+Dz3IWNgmOVATaa3f0reGXbGUN6bW+lHVzD7dXFQdXIqWNWp
 aMCS5eeIXmsWQTKa/e4ggL0bDLIPBMnwfPJWkbg0HXpF+oZhoI8hBklL0EunqPSZgeDk1luS7gF
 fS4A1nfbRswV85gBuPvJZaG6/pMCqFCrQOGQ1DkiT1mqVXvnGhXs2N9KGozlbhz0uq0H31GHVmr
 8kjW1Eo8izfg4mkuLKA==
X-Proofpoint-GUID: Ekvcfy-rvxAYvYbZXxyM_hhfANQsyy_d
X-Proofpoint-ORIG-GUID: Ekvcfy-rvxAYvYbZXxyM_hhfANQsyy_d
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDA4MiBTYWx0ZWRfX/rFDdUECdzUM
 NdnA+ABqCeCtTuXRau/g9IuwIw5H4OqKrW5d11euFsiHV+TfT2vIMfeE7UfAkH+y1t3GooSMuQN
 XBbjxx10eTaklfgt77FOp7lzdTnmglc=
X-Authority-Analysis: v=2.4 cv=W8cIkxWk c=1 sm=1 tr=0 ts=6a8c0e82 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=L1ubDmCvsYE3eyL8wp4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240082

On 8/9/26 3:23 PM, Shujath Mohd wrote:
> Use the 4-pin UART6 pinctrl configuration for the WCN3990 Bluetooth
> controller on Sony Xperia Tama devices.
> 
> This enables the UART hardware flow control required for reliable
> Bluetooth communication at higher baud rates.
> 
> Signed-off-by: Shujath Mohd <shujath@outlook.in>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> index 14663948d4c8..395e8f1141e3 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
> @@ -775,6 +775,7 @@ int-pins {
>  
>  &uart6 {
>  	status = "okay";
> +	pinctrl-0 = <&qup_uart6_4pin>;

Nice spot - could you please resubmit this with a slight style change
and add the following tags above your signoff?

Fixes: d54331131cde ("arm64: dts: qcom: sdm845-sony-xperia-tama: Add bluetooth")
Fixes: 30a7f99befc6 ("arm64: dts: qcom: Add support for SONY Xperia XZ2 / XZ2C / XZ3 (Tama platform)")

diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
index 4c63286d8b04..05e5a3674e5f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
@@ -754,6 +754,8 @@ int-pins {
 };
 
 &uart6 {
+       pinctrl-0 = <&qup_uart6_4pin>;
+
        status = "okay";
 
        bluetooth {


Konrad
