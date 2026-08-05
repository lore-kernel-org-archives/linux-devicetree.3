Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469BB449B26
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 13:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785937577; cv=none; b=eG7o5zlQ61IWHu4olZYS+JovnMcSAR0kr7BGsWjLsf/Lp7qKNAJEOsxVEe+ZsP+tyiM4IpxND6hXliHzIOcNGbO2/Kt/AkMUlgyyAkqpGwA0Habe/4PuzFIP8Ci4fQtlLlRvxDHjrmIB6J8zxWnHlyj4mUzQo72T5JzAQTpc/sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785937577; c=relaxed/simple;
	bh=YemxJ5KcS5E6bbtXrCf+6kyyrvxs33uWuztxGJqeuAk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JaieIsB47TT9wbJ1ldQTzX9f4bnzlYj7Uq3K9jC5Qs636uXRqgfgixFBFucTDOERW4y393tse1ZpzV3gVpofhts3EK5a2aYfPW4EZY7xBUkjeZRXmcqJnMf8RdFqQMvxDyIJQui+S0LIL5IauZu2gZhDkWVdllByboi5PV/GilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nqbn9/5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bqJAarqD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nqbn9/5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bqJAarqD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 675BvMbv2581885
	for <devicetree@vger.kernel.org>; Wed, 5 Aug 2026 13:46:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P0w6tssMgmHc+CHKvUizyDFh
	45myRtTNdkIA1wbeK/Q=; b=Nqbn9/5/8+Z8hd0R5A2CgcRkvBNdEi7bWwSYBUry
	j7FhXtD1QVnixue/BiLKNGnRT+k1PrVv6BR0dVNzQFKcBM8HidPyf6vvhW0VDj4J
	AjzGNs0WuxW1qhFuF09nkdd3lEDC+a609Lr0ggoFzhrj4WIhV+14b+ScI0TFCM55
	1KXWGFywCeaWiTYro1ZPW+W65bTUSOn7mkQXQUqxneFM+YpwKAP1Ex/MWJI5fKNb
	8OD9MLnzbA3HplS7pdVyEW1PZhI+5ne9tQoPoa2CdqnzayRp/k30FR3W1KxtmkKC
	VBYKGKUnmUjdsvbEm2m5pES2KV+I2AX8KgpCZZ87Vp8VTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv1qg99jf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 13:46:15 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efe7db1c42so10950596d6.3
        for <devicetree@vger.kernel.org>; Wed, 05 Aug 2026 06:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785937574; x=1786542374; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=P0w6tssMgmHc+CHKvUizyDFh45myRtTNdkIA1wbeK/Q=;
        b=bqJAarqDw0IScW3qmIoKwabX43JuQCfVxia3QFIDARpx370jNVpup1qCX/VrtLtCqm
         MJS+aT7aS4iQTTcxmOA/FE9JUQieyq0VXZ3nHEMsjsCs5I2WHWVDLqYXfR/0k2pwmLOR
         MrFrOfVSk2qk3K0pxs/HqMaElHrTAPf1fKJvjVic9f2WGb6REufXLS2GuZl0MhwzcZBH
         Nl3oW8uLJoAP+Sp+aqGl8wGEFx1DmEfE2CmV/YDqLLL0LeePzRWjnH0oF/69MP4n+Kc+
         UpiXeuEE5qSMdyPew0S8XeyA0EyyhmQxqMwUIIZAf4hv+GUc8HAlxIBAvKpXZuuVC2sF
         QyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785937574; x=1786542374;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P0w6tssMgmHc+CHKvUizyDFh45myRtTNdkIA1wbeK/Q=;
        b=L5PIDEmBXJXIqgSDMHFKN4aILK9ek4SzhdMYvEfHn3lOMUGk1p/znLtQgj88vH6WPd
         HNcykG/ZA6KMbEEt0CZ3e2y0EOYAK71MqKlzd3o6o5mXFGR/QCgJPUQELl0u4SlP4LnC
         VzR5Ag+hCRxD+RlD1vIJhuwOnJd5bbNLi4wZ2gk4Vn0kT5wqtXLN0O9TbY/AACESE07z
         9FmhS6MRCwUlCywZa5nUcNaZ0eHiz1tzsHDFk6nofdKEDIpPzjcEkXTjR8MYcviuncgb
         jqadTtmyem/vmXVz/gweCrl1jm1EEwER0TMPEaNTD3V6jvIBvaUMfhNsLopkbCcOthxf
         VLgQ==
X-Forwarded-Encrypted: i=1; AHgh+RoinLDlrGhPtYjuM2WK2W32rW1TzWTVmxp830TMeb5aW4Rj/qoDJjt3sJxjqB72h3JTeATMFC6GjZ2W@vger.kernel.org
X-Gm-Message-State: AOJu0YzKAI4OYP4DS/BnudZBSJD0Rj7xFIks8/ogR5egsDpZiXamF1q3
	z9zdeBqqvX2/lHQj7rvZ/CNBsemkABT327vjmxabiKrxe4jqp5HMXWJbbMe/fXZtavqUFXPewj+
	/X6lS+BoUJXgPXdclXh8qIxWbVqoLsjqrlZomoSNKKsmST6Q9r5Kt1B8wj4oyQHwB
X-Gm-Gg: AR+sD10KS+9RuiGPYT9D52ogOW0lVgJmW21UD9sRZTPeDQjp3pAqaRwtnWljt9mHu5X
	QrD+Yt6+ZcQzIL9rE/lOdg+5KD4qVm4a5w2L0XPv67CEDLOBAA8FyG5vUEfU6p/HBMVBiO2M2G+
	l2j0mYPYFqKq/1UiAETePwDEhmqL7BHMBjfQW1yepFEXLYqHnCxPnCcnS72/I0UyyqUYaCVHCAT
	tV0/1VQuG7QBux/0l5nhHkMFBfMgxdePLCVBpXEFuGp/0yjuTIIRkr3b43aFjRwH0GOKR9FlDv2
	tfVpitaQCVOwJvvuvVeIwLKfr2VRHQegXxBYZC/stuQ4lccM5+H2AWxzxVZXVDnQEMd0uBTE4r2
	2f/0Kx0nN1r01Jg==
X-Received: by 2002:a05:622a:1650:b0:517:8011:3a4b with SMTP id d75a77b69052e-52ce60d57a6mr54299421cf.21.1785937574261;
        Wed, 05 Aug 2026 06:46:14 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:517:8011:3a4b with SMTP id d75a77b69052e-52ce60d57a6mr54298491cf.21.1785937573689;
        Wed, 05 Aug 2026 06:46:13 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.37.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036428dfdsm118666766b.47.2026.08.05.06.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 06:46:12 -0700 (PDT)
Date: Wed, 5 Aug 2026 16:46:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add Advantech SOM-DB5830
Message-ID: <o2k27ws7hyfkpj37d6alh7wkgj5juc3lohoz7s25mr3nde3pkd@f24ipnxviyeb>
References: <20260805-hamoa-come-v3-v3-0-20463c43eae1@oss.qualcomm.com>
 <20260805-hamoa-come-v3-v3-4-20463c43eae1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-hamoa-come-v3-v3-4-20463c43eae1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=I+hVgtgg c=1 sm=1 tr=0 ts=6a733ea7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=Afnz6uBANMlDQL2PJxecKw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z5fobwZ7jDAjlPIfQy8A:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: K989JMBuBuyvVZRG65Hv3wlgVovusvQh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfXzcPNslA/3FZ6
 64qNa+H2hWZlbQLqJaWYL5sio5PklotuvLJuspaulGz7t3hnTxU9OqEqczKu7MveH8ZHWImXezG
 C2zRKzf707UIO3APfGJ7d2lWC+XkSmSWf0gKBkm76+LzaGxO7kD44iYncPVHfStCOelsdaDzK21
 PqXfUwYibfxmuj/zVrU15ZGIdf4TCFg3VtOdhdz2IiMK5DbfisiTA4s8zMY9uaYXSfRkNQ7u9PA
 awLwklZQ7V+pEK/GAv5amWCfhhs4kzyUEf/Cfqplfvj2EVCh7g3hFjcm+SoebCAHmHGbOtkPCma
 XQPqH5bcxPeY1BQ4eLt5k0OK92XW1L3twTYQEm4FcBAXFd88CnneYOBIBuQVaI7R/1BiBAjZDil
 0Ee5ENwyDTj9BxTectsD1ND1SH3oNDIAo/3yDuD4fKMj18+LNA+tyJ/84ldreYRvxNJf+JzPdGY
 ER+zn1scxE7eZNOkC3Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDExMSBTYWx0ZWRfXw18dznCHwcHG
 Qvm1g0bw3gmPR/6QeADRLZk4kD0GBw6YtpsExRHusxj4qjfWDFlJSf95z4fw5na93myx8AHNHlg
 Mn0o+KACzaLOV1pilntsfmJ1HhKs9Y0=
X-Proofpoint-GUID: K989JMBuBuyvVZRG65Hv3wlgVovusvQh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_04,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608050111

On 26-08-05 18:30:03, Yuanjie Yang wrote:
> Add the initial device tree for the Advantech SOM-DB5830 platform based on
> the Qualcomm X1E80100 SoC.
> 
> The platform consists of an Advantech SOM-6820 system-on-module (SoM)
> mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
> IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
> components.
> 
> Compared to the HAMOA IOT EVK, PCIe controllers 3, 5 and 6 are routed to
> expansion slots, while PCIe controller 4 is connected to an ASM1164
> SATA controller. The platform does not provide a USB Type-C connector.
> The eUSB repeater (TUSB2E111YCGR) is configured through hardware strapping
> pins and therefore requires no software control.
> 
> The initial device tree includes support for:
> - UART
> - Regulators
> - USB
> - PCIe
> - Pinctrl
> - ADSP, CDSP
> - UFS
> - Graphics
> - Video
> 
> Regulators, pinctrl, graphics, video, ADSP and CDSP support are
> inherited from the common iq-x7181-evk-som.dtsi description.
> 
> Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
> Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
