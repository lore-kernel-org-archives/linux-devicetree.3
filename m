Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D667F3BF68D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044014; cv=none; b=Vs7wTHlV/j1LZpJdKKtCKxCFmqN7KZkGUnuGleJOO/RUvSLDKezGEPvwNqy4D6JnHkqtb7a70wX6megJaHAkIFZfnb5fa5jJQroDSaTHyeLBlvWATqFlhuks0Wd1ScsgFwr6p/COrE4yVJMJfNoH1CdlaZFhf4YvDzyFKIQtmxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044014; c=relaxed/simple;
	bh=z50Dwbp+KUqqg693Z4+fUtNTAtaDy+2EmV7rI7a0Zx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QuuekpmKijweylXVYuCUkPSIweDLfcpJz7UHps9ljJS3uR4YXLfMkn623fRA1NqucdTfLvD+BRv0Lwx7lLUbXjiz1hyXghLdqPvgIcoeW/+DEFLWSjzeNTYd74Ndjf7maeGYpJOWKL2rMsF8JSgmOlW4RFAGbyGm4MYJ2qIyilU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G345N9gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAxvxvit; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G345N9gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAxvxvit"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BL2p310041
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:06:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=; b=G345N9gh/SFKyB4U
	SVhrtb9xePJszi1CVrMpyXPWaCMaoHoMJmL0etlaE9gt8oUi83kFV8fZGq50WgeY
	JhQZsQ4yheYCfcwNibUm/ASYX2MfA06Pmhvwe6Qux3C2fm8js3mo8roxjDpVvUNr
	MHdDc2NRR3fneCEhJnLehXNCBrZHRIY4M/i3ouvMJfQv0h8bHxOp8HsnyjfVvj6D
	B65slKFoPSIVlOdY1ls6+6RPPL2pQGKXaHfVhlLluvHrFz4h44ZFahpcs83u6Vzj
	H1EJdj5jOJG7ewaSjXg6KAO5UCFt4F8cH149SRFVwPpPQrEnXueF8QXf1dW1NPlU
	bI7RdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4fba9d7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:06:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e21552dso31033985a.0
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787044011; x=1787648811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=;
        b=jAxvxvit/1LC04HerWGJeRAbvnnqPWK8pfHpKj+nq23R0Z27dL5Z28ruxc9n4cMCS4
         fPAEy+AUP6KpQs/SLgFwV974JNWkCY9048Z/g6RZjJraBpBg8DbtEizlDKDrxsNM/LlU
         WQKF6S263dtMCh8cYgrPl4t0lcl2JAmguuRAnYHFP1ueUwsK6AJNi9yJN2huqMeFERei
         ZmQ8txgtnvoLL9B4yTF7iVZPlYBO1cX8Da+MzatCox5tZObRMnkdYq9ABxMwCg7W5e+S
         IziRmmZNt2X1XymwYO0///F017EJHs2FZZKp0N930ScHDYhRh1CEKr6pMd81Hiz/fxMi
         Is/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044011; x=1787648811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=;
        b=VVxgJ4qzCtVKkq25yQWtGqWRxXn7ysCEH5G7VVNGbv29JVVyz+OL7o9Z0x5C6cym43
         HWXjOkLvblFtufmzA5BNrylAVjJc0JBClp2wwilOWEQLMnVClL4fcmJHBZSu7uPYR2xN
         gkTnmquB+NvAavXZ6fW/CXMc3a1GdAzmNHUvDeoMj6ad3ibDA3+1t2O2AKgF7ZC7pH04
         sOrDwFyvwe6XBnXEEUsgNjvXm3tTbsWrAgC1IllSOWqnxi7i+ll8P+y2HUzoh2nnmnQz
         +tzqZHEWwMFLrsu3hFub6GUCMOoXT/0UCQgR3hTfb1rMz72Z85r4LyG6L3omTBAkFzQM
         6Qyw==
X-Forwarded-Encrypted: i=1; AHgh+RpQaQrVB2ZdtbuurEFCZ0I1vzRokxFaTTcfwJYHR8zg3PJZYoBst9GXxAnRNZ4mS8QOj8s2T8YvAGtI@vger.kernel.org
X-Gm-Message-State: AOJu0Yz20BvV+jzQuFGDOL7JOc8EiotsFzWRVvVNg0h6ge9xxGK0PRvm
	p6Ax5CZgQi1LRkSrj7c5k9VATq2wu+Guc88JngbrvmQopl2Y8h9LgHvUT4w+i713iuYYKFs0RiO
	6/FQJH5zE8CXs5NbyvPE/14HVhuq6GzuwYCvlZtVHKpgKDj5jgG5UpnCePre+Eg+2
X-Gm-Gg: AR+sD10mLTmXdZCUyXy9IeqsIjFDILSrgxvHbnVPUmjliocNjtMWBkI1D2IoCMF9JxD
	KkVOfsZvsQjWc2Rau/8rn/ZBDl5xeuCxPYyNnw7+fS37MnvQ6/aDu7rWpSR8qh9IWed84PYqKBT
	W2n8WU0Rc/kHdKVbtsvF2TNP4JvaVfeeRYm3G7EFUU3B3tpGyatANP8lU2WyTuNvsEelJv2uQ6U
	YbVtUdJq81k3szMWqCYabLM0Vx5b1GFnLlBerd4pMuE2Opbyd2HHHdl4rEtnIF7fVhkTC73ilj5
	8wH0zcsQY2aQ5cJ+9jFYvl6vemsJQZKdlWsdo68DgHZPPXG6wCWzsMGg1z8vfBuw97sVtmPdyD8
	331QGBAP+xot060lkwrzdBusz
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2349736985a.0.1787044011044;
        Tue, 18 Aug 2026 02:06:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2349730885a.0.1787044010319;
        Tue, 18 Aug 2026 02:06:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fed68f9sm155764166b.27.2026.08.18.02.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:06:49 -0700 (PDT)
Message-ID: <dc555512-3161-4c4b-975a-7ec60a8f1a48@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:06:47 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 USB3 host
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX2TYFPFa2P6FF
 KJPFsH7KDX7UYxniNLZdasJEK5bjogfbrQSG+nobxcM3yS1VJByyVdzV4+G5D9/COOt7/jBzVqL
 le4Rp+v3xy8YUiVWrDOIuQWSyjnvvao=
X-Authority-Analysis: v=2.4 cv=VsITxe2n c=1 sm=1 tr=0 ts=6a8420ac cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LTL54F7UJFTHhO7zyW4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: VrAG9JMf67E-mqrV5aBrQNbhoHpfg9mO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfXy1ytqhgXYxyC
 IiRJo1p3XOTtfu9nW5svTHEMDRQiIo9k06aud5zsp/3qkX21cNCAgSHXzPD0QpHf/+eGQ6hqDT4
 gfwiEenMzewsd0LxLHTkU7RzuKfYViG3r+ullbZSiL+SFmRXd5n6KPAlzAtIz/WIxvVJHyOQre7
 2+XrLIMjatxzOyOjuNeYt9kjrK0z0EeF2Uat2AG/LsEm/Lm+iygc6WqdmCTHOVpoYNXj1Hbo3tO
 HMA8Ia1YpsP93gHPlFpLZ8r8488PcBI7CDP+ya39Ajy1SUrxlc3/4+oN/r0r3un2Xum1BnXAB2W
 k4s+a30CdCJy4JU0uRj6qM6eRStO1gfcOgA9MYa6/mc9sHi1mQxwDHh4twFRHLALHbokfVThBEj
 eA5s+gSJX4pkTc9zCiQSyxDGbi2Gzy5jls92QtDl9ljX5AoK3AG791sWpNRnfSNIB2OBI1QRbHM
 0KVcd0Vv7LPpbuh2zEw==
X-Proofpoint-GUID: VrAG9JMf67E-mqrV5aBrQNbhoHpfg9mO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180066

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The USB3 port of the dragonboard drives the onboard TUSB8040A hub with
> the AX88179 GbE controller and the PL2775 USB-SATA bridge behind it,
> but the controller is disabled and nothing describes the devices, so
> their reset lines float and their supplies are unmanaged.
> 
> Enable the DWC3 controller in host mode together with both of its
> PHYs, and describe the onboard chain as device nodes under the
> controller: the TUSB8040A hub pair (with the EEPROM-programmed
> 0451:8041/0451:8043 IDs this board reports), the AX88179 on the DN2
> port and the PL2775 on the DN0 port, each with its PM8941 reset GPIO,
> all powered from the always-on 3.3V carrier board rail, modeled as a
> fixed regulator.
> 
> The SuperSpeed PHY is required even for the hub's USB 2.0 half to
> respond: with the SS PHY left uninitialized the hub connects but never
> answers enumeration at any speed.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
