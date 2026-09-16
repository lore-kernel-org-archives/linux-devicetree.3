Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40F74FECC8
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565601; cv=none; b=gHzV5pdzsQ7Q6XDhvxS+Cq7n/AlDgjNXFVy2/bHzJceMVpFtgZlWOk52ygymw/VhuKCo962GoKpzO3J/Fjy+XibCOZsKxemDyXf1PDsfQ6/5jN+KyspTLCFKloF7kJcX68d/zIk7nMhJWuyeosQIs7sc8iszMiTRGh5i/5PkG+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565601; c=relaxed/simple;
	bh=pSG/TrwXhQ2SDtoVxMKdzFoXta17jnhiWAGC9pF1ycE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Oc3OoIvfQ6fQpieLqZmRC+qi85UlAeuzQRBKqBwlXyss45UrfruYr/rVT8VgU1HSBc6Swm2u6EQ0zMurNIlatIENh8+6FV9FI93a1ZrHgfhcwutp9L14OVoMJ93/yxt/ISA3M5lzcVrcoi6FRywuQghRirRmZEAj47pYXhV/wPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e+LUSMrR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IajFUMuj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e+LUSMrR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IajFUMuj"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GCYZbU3291271
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WSw25v0bjyM
	ImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=; b=e+LUSMrRDwemHg4p3ifF/lzSPkU
	zt8FGkx3j9M+3A7eYDS6Spkff0SQ4hwBEsrh2+vJ3NP/xNWGQDY6aiISob6rRZ11
	GKoNfvIvpg4u4rN0R4suLbisqtCokQ8WYI/FCyhGDJNsOKTlrssw5PAK+Y40FBbl
	Ostu745vptMplsHY3GwU5g33+3YiR4MfwQdR5vtI2N8COs+F8DVwhU4bmD16YEwM
	lOQakvzEkhyIQOyj/1XfRlVc3wFU9Uq4qTixpS6xp9AJWRHkRz4Ev21DDsCj9Tbx
	Hub8xbfP2NczQ6bgBtrecHN6YQ/HcE4vUdBYbAYKdacU99wfTRM0PB4UX9g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfk260-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 13:33:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so106522875ad.3
        for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 06:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565590; x=1790170390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=IajFUMuj3YDDivI/ZNpbWu2zZ4zfHCxIerLxj9/qsXDpSlrfLL1GdI6bLOHPysux9G
         2jq0R6s9MbGicC42gzHmCiyDatbovPSfZV7pqsRfIVIaCTNcEa2DGYhRTN/9FkHvKQ8O
         5jf5uuZeYxJLz9lE9Kvuqd8WbIzmLD2p/vGEyAu+EZ9qkSJEZ4LVh6NloBdpOvLn/qkR
         pAC9v9L3bvwXkErSdPZg2W2HAaxONVrsTTwj42+c1kYxCZHKmD6IQHXeSZPhO5i/wuB5
         3Si4xxwt2nD2FAH7g6YQBt2DQPzX7l0mtl2Act9Zbk+6K3nOFaDpdv0mbX6Ja9lAvNJK
         PtLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565590; x=1790170390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WSw25v0bjyMImA+vtAQs+sdauYT+Btn5U4Rr1BPpU9w=;
        b=izoBrr7QZb6nAa1wgOb1gDgvsEwvQhD+cJB6KKnjB0gE7naYI/5BII8octjhUyl3Fa
         oiS1gd1jnuIUwnUrh2KXA9w5vIrFVaZodwBTzqBzJgdYdtZfBGRksbDTwrphfXqX3ehO
         J3sD5R2Rp8ZTEUq8LXKK7MbIfONLJvOxQyWqjx2dyBDjCPRBMyBmhjDjdcEIxZFVXIrs
         M6O4cZb88rEMYiL0LP4E2U4SA5q1PtwmnOlPbUz+RLpecQn7BhRme03yeIOKopWgu60j
         hfy9qHXxy/w3P4u8CIi2ZGyXcISkt+GnjoEWI6T4xWEPeKll8AawRxqUlALwetbGTYnn
         k6Dw==
X-Forwarded-Encrypted: i=1; AKwUvBxvT05PX0DlHZlIJkxZYHcXAUfUY4CD19xShzs0F2avbqL6N4tBcfPJriCnNoEiiOMELiVUhZHZ/S7m@vger.kernel.org
X-Gm-Message-State: AFuF++ntqQgBMmiZVMuMoTpdKkFI85QIvaXM8dgi69VfANYSsNJhOnZ2
	aTmp+fzfyZ9KSKyEhCstlnpP1gYyNzi7TUsUUPPpkh9P5aWTi3LsI56ejLqsWmZ/IYu7uzxwtg4
	WjURN2E+igtANzHnYWu8880O6MVfyLLM0Z14gs6iX39gTT279yJZl0iFiCbyUpLFr
X-Gm-Gg: AYBFou3BBZ4rz0BgT6Qo9otKdlZUpvxH1AkgHDKjhzAmbhgjXphH67iW4j/B9TcbV9K
	H+ttZXvO6rjpZ9ss1kY7jl1feWNmdWVE9ruj1UQe4HkxPaxqXDNs1um9bk6jqjK5+0dKibkOWtW
	8ItTEjodZoEJ5X9W9NdiUEpeeQa7JP3zJrOBrUWMZGkS7MOsBVOzcbV4l1xtrbTOm+zmn/W3b0G
	Mr4E5PO5Sq7a0KzHz8zZuyhMO6gbFgdEgGhtxJ7EdMBVMSeesUReLaXoNnGp/xiRpi1xydAKm/G
	MuwlB5HWp+e+iwD9E4h2WTdic5u6gd7PwfYS/71u9l4a32yexKZ8BLIrfLpe/qvGONADuL6fDST
	kxdcMOGCxVpCsnKLXEONzUYNOucQmKnzg
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60389745ad.10.1789565590192;
        Wed, 16 Sep 2026 06:33:10 -0700 (PDT)
X-Received: by 2002:a17:902:db06:b0:2db:18fe:bb08 with SMTP id d9443c01a7336-2dd8e632e4emr60388955ad.10.1789565589697;
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89ebf2e2sm12077945ad.42.2026.09.16.06.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:33:09 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Sriram Dash <sriram.dash@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] usb: dwc3: add xhci-reset-on-resume property for power-loss resume
Date: Wed, 16 Sep 2026 19:03:04 +0530
Message-Id: <20260916133304.3720801-1-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <aqSVKL2riEdZfS0D@vbox>
References: <aqSVKL2riEdZfS0D@vbox>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa9a97 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=hk5jl9konaNAbWeGehQA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfXyuUdQ9h/e4jW
 qrOL37bW2nbwrDYPkZsVquPAW3rLuppO5H6AKify3yfD040gR8kAxdUyoOGBFKLGvIZ2yRKqEuE
 SQuy43zmTqTwXr6Olsw0bfAC3q01YmclE2Gec1Xz8a/gHScm+I/A7+23Z5Ha7uRV25re3VLoUy1
 EONdowQyio4vc8hjWmdKOQAnjhwSZJAVZDpAe14hfK0M9zzQIkuPuO5EQYdkoPjC8vK6+czFSyo
 JmX6utOjDcbdTeVueTgp4n20cdQ7A7wgHCynsIwuwozENKpYaCHjLaXgyl8XZW+kZK2N5KUald0
 4wPoFar2/Ymb8JYnbVykISB64AdGnvq3mGeOlgfkZTkJZES1uOHGp3JRZA202rSJvD+HRg1MXSQ
 +OxvkHAywIb6zFIvg6yBXHJhmuPWYhx21VDqJxYO+s7/Njav38NBw64/7U0uLjWxneKLOIzyvg4
 gPtLbqM0CXe95laOdNA==
X-Proofpoint-GUID: JDyDUbofl4JIOvhaPPez34x8w2uXU2wJ
X-Proofpoint-ORIG-GUID: JDyDUbofl4JIOvhaPPez34x8w2uXU2wJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MSBTYWx0ZWRfX1aGjCalnFRhT
 VYvJzpoYz5ru2KaOZRlrGklgtpSFGVTBZrpFCoyFjAm9nHahhBrWhe4QZG+PuqkhtFIvxR47X1/
 2dMIX4z1q6kUMV+raguaYrWlV7s+b+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160181

On Thu, Sep 03, 2026, Thinh Nguyen wrote:
>> --- a/drivers/usb/dwc3/core.h
>> +++ b/drivers/usb/dwc3/core.h
>> @@ -1420,6 +1424,7 @@ struct dwc3 {
>>  	unsigned		wakeup_configured:1;
>>  	unsigned		suspended:1;
>>  	unsigned		susphy_state:1;
>> +	unsigned		xhci_reset_on_resume:1;
>
> Can you move this after dis_split_quirk and add a blank line to separate
> properties from dwc3 state/config fields?
>
>> --- a/drivers/usb/dwc3/host.c
>> +++ b/drivers/usb/dwc3/host.c
>> @@ -129,7 +129,7 @@ static int dwc3_host_get_irq(struct dwc3 *dwc)
>>  int dwc3_host_init(struct dwc3 *dwc)
>>  {
>> -	struct property_entry	props[6];
>> +	struct property_entry	props[7];
>
> This should be 8. There's already a fix patch for this. Hopefully it
> gets picked up soon.

Turns out this whole patch isn't needed -- see my reply to Krishna on
this same thread. xhci-plat already walks the parent device chain for
this property, so I'm dropping this patch and attaching it directly on
dwc3-qcom's own device instead, in the "Support broken suspend for
SA8255P" patch later in the series. Both nits go away with it.

Thanks,
Faisal
