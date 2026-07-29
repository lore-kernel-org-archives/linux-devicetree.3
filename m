Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040FC397949
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785339606; cv=none; b=IoejrzpTt08dP5XbbdbpoUQQnF2ce4G45v5wUU9j0vJJUWoGgBI947IrJzAZHRln5AyWGqayJk37DhXqPlDrZPtjobUPAEOQ+bB8q19duNvLHkFYsGizKjyKdO3qBW4N/4yWocnWLrbqUA6saRk8IHAMhbCRmL3CubeZcTW6Jks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785339606; c=relaxed/simple;
	bh=sLEj0DEYQILFQbpEt2OYOUuE4ZC9Gnd/GDqKxRJFH8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nIQl+LliotfL2+wmVO2p9/P4fef0K1sqz+YxL6GGoUVBZnseb8w5vYs/vo64G1r9kSG8PsTdWglD9tnPKyGrocafWu50EIK99C0NhzPmLgiAORUHdcyoIrQobRphkXGBd8wQVyYRgKBQpx1XWu3ZdIlgKh6q9vGEsg4Dk+mEJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CKhwwqCD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BMJI3q5e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CKhwwqCD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BMJI3q5e"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2TWB2591751
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:40:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9SBsJFrqume2aqb0uRjijPZX
	7OxNXfNL3XcOWC66BLQ=; b=CKhwwqCDKZI236HuzGNeh9kZ3G2DqnIE53P3GT13
	NC5kg0rUZr+Qt0SvyewEXRFLCJ6VMwws6573dGRCSJFrQNBB+TwyH9gAbZ9GftfI
	koK9699slV4Vxqmb7xCnefpWrQnI+5h89tMPuQl56AK6rOYYLhaXsP/xNE9nUYWU
	fyjUXryLbV8S+5XMHv8+9jDarnQRzGQptXItG4YYqd97KBM0f2FP7bV42FQJq3KF
	cfTCtha5TqbVwo3JTUhh0mS3vTGmbqIk/b38T7xX3QvErXms0GmVs5laam1tf9Dw
	4IV+i9T9un7j0WDkLbAVwHDCujKZ7j3tA6hF2TaypPr/7w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqke08dej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 15:40:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-526da7e3c9dso11456521cf.1
        for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 08:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785339603; x=1785944403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9SBsJFrqume2aqb0uRjijPZX7OxNXfNL3XcOWC66BLQ=;
        b=BMJI3q5exroxpjY3VxRxxmma6OXmYFMf+FrNPT2X2V3kEoMFuUHG591Xj0jd0kWSuR
         b13jY3qGAENVy2lxC+IfaDi58ZakGc8IQocq7AmrgkqOI3sjkwig20szNtNqciM+BrRy
         9pl1gevbjc3P9nSmbQAw+Ld0+Tw/eb3eTMCjxgme7BxlUd/x1S9oiC7Bx6O6+zP5CewR
         o/5EGeTyT60Ia4xjcAsvOWufO3B/dj0LfvesDonAB7SMFViKAqT40/xmp2SleUYc3gSH
         2c2m4ejOm+uMMxb6OgxtQe//UoZYhVAWhEvoX40d65NBTyEb8ZMG7NQu7cRf55OvtVu/
         m6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785339603; x=1785944403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9SBsJFrqume2aqb0uRjijPZX7OxNXfNL3XcOWC66BLQ=;
        b=bARgehdaAB02q4iZVAArN5+n0bzI3XXIqR8bT3e8iYPHnlCJcg4hxO7ZqKE5O5HS0A
         dW0ch8YcPaf6HV12O0MPwv3EEjrKME//YJDjCyt5KHWPknB5ZBqV8KSE1W4kjzahkYRh
         JQCJ+eJaQOfMix759MI3kwuuvIRJz0uRDJ3l5z598ILzlbh8Jvf7xjvkvTXcTOMUj99D
         +vANqmqy+b9JUBoxLCcqxlnhxPScTB1FD603kDWANAlv06jEPT/ND0mW/SCyICyYa4IC
         FiTj6GB1S5CjKKOwVRCyPAdiVhDv+ayw9CUrgb2hibdOpKSdjb4HaxAqYhIDOC46UXBc
         Iwew==
X-Forwarded-Encrypted: i=1; AHgh+RrVUIix9wPVV7lPGjIxV8XycMCTXtUpOx+WtHDNpYN8iKL0bcEFHeA7jJZ7gI7gbFzPS6LsyHM8oMr6@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkCUdZmEzs/YLSw3txTenRJOk4KlKJrZb/+Fk5RK3yfdsa0tk
	WlkMxgFpUv1yYCVQrDjNMehzc4Ig5yM/TDY1fSFvdXIlnwes+A1O1X3HEwGz/hgrDc5m1eR5V41
	W3mFyhyuq7gOjfzj0GZ2zPVS01yp7zsC/GLX+vnxG0OfsRixOILM+XjZgzv2/HGpC
X-Gm-Gg: AR+sD11GsZmU+SatnXoiLcWegJWaF/GiNo6tKjDQX/O83CsYe4Z1q9p2KbU6RbPxSRE
	5bgSC8Sd1R9Kimpf6P2VhDICgoBCerc/UinaJ8t45Z+c8MEVQIVExbdbDmPaYyVdWVPs9UCTUul
	XZp+JqdUSEIxr+fT+ocPD2eEB3PIJmVT5HwWZPp8jovtT4CQwFjC6JFrjg84pbAeLzL6Riewq79
	aNWn/Luqpp31rUcXU/WycDjmpreA75VTLrO7+uT2lPBG4v5baJtKLuZGPOfII0QNoIlioxV3Zzc
	hXP2RfKIrILnhrQn0dK3FUkjJfwPpJnb3/VIDxtr5eK+DluLm2R9sd+vtxk11IPx5Swoby412IQ
	mLiPIgB4zdHQa1Lo=
X-Received: by 2002:a05:622a:180a:b0:51c:1bb9:137f with SMTP id d75a77b69052e-529d6fea697mr63643331cf.24.1785339603116;
        Wed, 29 Jul 2026 08:40:03 -0700 (PDT)
X-Received: by 2002:a05:622a:180a:b0:51c:1bb9:137f with SMTP id d75a77b69052e-529d6fea697mr63641991cf.24.1785339601365;
        Wed, 29 Jul 2026 08:40:01 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c45c297dsm157031645e9.7.2026.07.29.08.39.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:40:00 -0700 (PDT)
Date: Wed, 29 Jul 2026 18:39:58 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, usb4-upstream@oss.qualcomm.com,
        Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
        Mika Westerberg <westeri@kernel.org>, Sven Peter <sven@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] phy: qualcomm: qmp-combo: Add USB4/TBT3
 configuration data for Hamoa
Message-ID: <vznsfyt3pxlz5p656r7yeuglky7qlquv5yl2r36aby6jwidluy@b2xujn7o5i33>
References: <20260728-topic-usb4phy-v2-0-5d9dd5149ec7@oss.qualcomm.com>
 <20260728-topic-usb4phy-v2-4-5d9dd5149ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728-topic-usb4phy-v2-4-5d9dd5149ec7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfXzUk40rnf1DRc
 Uh8Qef37Mq/7/fEtkZj+Uvnj/CwCWkbM5xRnnbBNv4X3K4cArjaTfbBd9+3Yp01V2WdE53AyHV0
 n5hoPMn451T/eX3umHJ6Q8AnCvtrt6UNPgIc3BbIG0sgq6P6a1AqefjPgiLRFzyY1XKB5vv4ZmB
 JfpkilEU2HOUuza2HbDEqJsdjPf/ZH4iVxe2DcvyaSXKlFELG5rfXF8Vz24aE9Q5dKTJ/ZbpCWp
 aXzquP2uJpoROT02vx1WtJ0vuRHy0Kb4gtFYq9swPgXCe22YuxXsDR5Rz9YkIrwJos1X8weCwU0
 FhDSpgs8mb1Wj9qJRuYJcdbbOL9JYORJrIgPvqw9IHylWVXMIBnzpxK6+VnWI4KH8r2xitCm1Kf
 U97/WCxs4z01kYQje8ZddDZ2tz2vZ6WJbN54NQUmlwfGy8wOdGDduvPZTEOnXLZ5qGARb1OA1J7
 HHnY3UP26Ci6ooEJ6Sw==
X-Proofpoint-GUID: WKk6VvFFUMar-LWm3pK0oYBl1rH-SefW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNSBTYWx0ZWRfX8PjdQ01hWx8v
 wMHLZgvI/jJZswqEf2Elo6oZ62MH7qMKAKYTJMt11vHfCFJHc48irg5QfYUXkQ0GDgHkRJBCa5P
 7BXSvbbnoQtLue8C0PA0E1g+CrKzVhE=
X-Authority-Analysis: v=2.4 cv=ONYXGyaB c=1 sm=1 tr=0 ts=6a6a1ed4 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=UsAkPbjk_MlyJrJ9_ZwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: WKk6VvFFUMar-LWm3pK0oYBl1rH-SefW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290125

On 26-07-28 12:10:15, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add the offsets and configuration tables to support USB4 and
> Thunderbolt 3 operation on the USB4-capable PHYs found on Hamoa chips.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
