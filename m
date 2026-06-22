Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A2C2D7DE9
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782108165; cv=none; b=DuzQRmPpfDiGDavNN2acsS7O2GhD4uVTklkgAFYFhZOzXhuV0fMKPgVE4R0AaA0epEGbqsx71soPmFZ7/Whj7nvydrGJ7a4K5OblK/E8EH3Y5TN2KDY9kGevvw701/aJpetVYu8DRo+WRBH6hpEAzFLGgqaeaIFHBNMlShDFzaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782108165; c=relaxed/simple;
	bh=fhF1jkIK148QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p2QXm2wgjVhfqD4uoItzN+pJ2EboJne1wmoCqFepMRxjqIDefj00484kK7vUu33RKyIV+xSiUoLEyCJ1bYU+oNCs+e4kRe+skpZ4mG8XZgIpQjZ0LdX6oMhrwv+4UYBSKWjmxofgcMpYQBoktRnAeMe6Gw3pEfqEhZmrSDee6IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2zZHh19; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktIt14/h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I2zZHh19";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktIt14/h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BZ8g255567
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:02:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fhF1jkIK148
	QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=; b=I2zZHh19VpeyrTBrzHyPcXUJCoJ
	OxAwhLJSCD48w/Uiz+2nYqkMuDLIy8928uFQawDl/7ZIfOQSQXoPNzhp2GXCHmPY
	szMyEtOPdUJ8VFGIq9L1oMlwe+aCkuWS/CE4FosGmI+jiZfL+Mzyoy2z7hFWumfo
	1chvL9sOx0f/hBj2rTiS7WpVsU67Qk0bHdxFwaRpRKwO6xaPRbY3/DABOCFtMzng
	TCNqfJlWmIbkAl1KZnmYvpn8ooaw0tee9+pkQWuKTUB1iNi9QRDKGbB2yAtH3n4C
	uWWRSyrWboTz5yzPO6umYoPeckI7JWbuZxh5FK8TvTqm0mQfo/QOkKz7cRA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewhv5n3pc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 06:02:43 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1399e7a6d05so445637c88.2
        for <devicetree@vger.kernel.org>; Sun, 21 Jun 2026 23:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782108162; x=1782712962; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhF1jkIK148QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=;
        b=ktIt14/hhlZNmWYZ2mAw7hzbmRJPV4eYb2/ObDPHJwZKxJ/gE+HhQ7EtyKELhN9mu5
         0/qSibrAfcy0HtJTSmDwCkaQG5dd3mdqb6SegcF12hrrzPAto7q69ORWV+byIUQyNozj
         UT/qSEp226D5AAKHk9i6gQEYjHOcBUtCrPd1RpXt4MTL65cOBPCEMyZadGbgxUEQ3xk0
         EfVeXJ7krlNE5NUOH2lWwJZJru4tpqUyeyflrnFMhYb/J3CoDSwe+DkdihEttBYp+h04
         3Ln1PmIapeZBoWic0mAfrMbyjjwsr1DrWFrRxgV4dzzr9pmkMC4shhFWFXFI2c0OeZqU
         figA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782108162; x=1782712962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fhF1jkIK148QJRPMwgMFNLtsyUT0Tq6j6rDts/hWXk8=;
        b=s/5LLAjDHCibzX/3XhePiHFFB0nGjV3PjH8dqjMQzCa7Dh67DQF9K5oOsuSfd1LzZD
         FxOqyln/c3uaRmMc/JYPK0jGE4PSoHBGMUxlYrAgQ4sYjg1CPqNbm64QnxbJhfxnNvy8
         YW2cR7stFYr9/k9/ED9ybLzU0gYMNg+wPTlIxwjaJo3d4dEN5d0vA1hRn2CMiBtofAR8
         DVaJqZgNW3Sa16SIEJPIy8fP76WbjPmOA1x4Fmyv45aJpdf5UvTuQtKY08LAmeargSbY
         tmgLpwkOIqZNYQFHDFDjr3tg/AjDbk1eMUPCLaRNOHNQ84mNLl7lW77rSpUxDRGBQ71B
         XizA==
X-Forwarded-Encrypted: i=1; AFNElJ8EyzkOUDkxg5D4XUJOvN3mC6Vtynj2aIf6IzeupshNj8ZfgjkWgL7Rf00KpeMfNPtH/XsovB2H6JMz@vger.kernel.org
X-Gm-Message-State: AOJu0Yw525au37+GxIStwT20eeWcWxWW2FXmfM/dkhCWqhEDtB5+H+lv
	ScEMkQJNywdOQwF4ul6aWYRfDpi7jM6lrYsLHimxVlBz7yGl4fz327lC+Zbo6FNRqmvhk+4oxxR
	RMk2B0WL/+oFgUGhehbiXIbF1xc0t9NIte5lz/0x9mFFuqM0+1oddxjHqnDRNsNN0
X-Gm-Gg: AfdE7cmpSuf8FNC/mPY2WD0AvuH9E1/tNEs0zUYSgf0HgD0VR3KgYOFAOmQe3ioAABO
	m9rcz2VbMtrOt6NSSz7JOe3Rb+IRZDvCS39c4l0/+C/lqxJmVQ+60acrQQfHb/MJVa3XEqHAOCY
	dmE+IhntuDwqDncod9bAR1BfAQfdi8VBdiBm5XWM1fHwnQAU6B5kRWvw+5zrPpnyxrsxWBvkkGF
	CHsKH9gVheEZDpFsH5YHezqrHyZ750ByWfJIgAqlDwdu09R6U1pG3OgN8mr93Raei4z/drCR505
	aNygycYNSk4EY6ZRyg5p97OFTymYLS2+F38ZHl7Y5G5fLVloop7GVC5jQ0ZQmtTSTnheFWzoFrm
	WKPLOlBJtZjT8eTUF+52w8kKFqWpiF1SnxsHhoWyYehsDyusjhehOXUGPZC0X3g==
X-Received: by 2002:a05:7022:6981:b0:137:fea7:9297 with SMTP id a92af1059eb24-139a2035a3cmr3794613c88.1.1782108162070;
        Sun, 21 Jun 2026 23:02:42 -0700 (PDT)
X-Received: by 2002:a05:7022:6981:b0:137:fea7:9297 with SMTP id a92af1059eb24-139a2035a3cmr3794589c88.1.1782108161301;
        Sun, 21 Jun 2026 23:02:41 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add5bd68sm7558262c88.11.2026.06.21.23.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 23:02:40 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, mani@kernel.org, brgl@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: lemans-evk: Describe the PCIe M.2 Key E connector
Date: Mon, 22 Jun 2026 11:32:35 +0530
Message-Id: <20260622060235.746205-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <580db7de-321d-4f4e-99f9-3c9a1cc5a3f9@oss.qualcomm.com>
References: <20260608091702.3797437-1-wei.deng@oss.qualcomm.com> <20260608091702.3797437-3-wei.deng@oss.qualcomm.com> <580db7de-321d-4f4e-99f9-3c9a1cc5a3f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA1NiBTYWx0ZWRfX6AzzGhgqQ7Aq
 qIemF7hoU8kmlU1KD25SgLvG9eIeVWkoHRFTfgofCwyr5n9mfmWdOQk5cCLNuVc+QdYtnqFk1yQ
 unq4D/TlYW0MWJBO/p7F/kCKkhU4Tri1SoCNN9y3q3WFoxRF5NUkH/OxWM9L29xP41tcPuMYO7h
 hQDf1pQpV9X/tQ95q7PsFnKQDxS616brR0Ht+8tOQPFOBIowwbocWZs+vh/on/jSg+LKdweKI77
 dd6PQBq+R0EviSPpO2t63b7gWqwTSlkSn5kepIQEmWlWKy9+87U+yebvcmFr4QT6UpEY9t0/STH
 6E5Vi+DeHsL8CngGGcfD2PwoRuEYsdlH8UU0/LOlPthwQLF0y3xe6oSFTYTYlpo4h/D1Jo85VKl
 VHTC57nD0L/wvSxHT0C2UQPPJ4ODJdNUkKYedgz71d5tL53zgnVrnxwZwUlKinrS+4MTFGVsITl
 WbpOGRQy13Qu/BexAxw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA1NiBTYWx0ZWRfXy7nieOS+KMhU
 CUAgJNTmuHe4bJzX2N1Mfl8Inp9kyzCXCbqJL3q9oXrEUoX0npL/OuDsa4TmMPmYhG1XoQ8ryy2
 4PXaTDc2mjN1XR+ifwDMsN2iPauYvm0=
X-Proofpoint-ORIG-GUID: jLhpgKSkJbH979DZ8NhfoY-zZHDBVM-c
X-Proofpoint-GUID: jLhpgKSkJbH979DZ8NhfoY-zZHDBVM-c
X-Authority-Analysis: v=2.4 cv=UrZT8ewB c=1 sm=1 tr=0 ts=6a38d003 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=wHO1jfwDuY-934FNkv4A:9 a=zZCYzV9kfG8A:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220056

Hi Konrad,

On Thu, Jun 18, 2026 at 11:49:05AM +0200, Konrad Dybcio wrote:
> On 6/8/26 11:17 AM, Wei Deng wrote:
> > The lemans EVK has the PCIe M.2 Mechanical Key E connector to connect
> > wireless connectivity cards over PCIe and UART interfaces. Hence,
> > describe the connector node and link it with the PCIe 0 Root Port and
> > UART17 nodes through graph port/endpoint.
> >
> > Also add 'compatible = "pciclass,0604"' to the pcieport0 node in
> > lemans.dtsi to allow the PCI subsystem to associate the DT node with
> > the PCI-to-PCI bridge device.
>
> Ideally this would be a separate change
>
> Also, b4 can't grab this patch since there's something wrong with the
> threading (multiple series in a single thread) - please switch to using
> b4 for submissions yourself to avoid such mistakes.
>
> https://b4.docs.kernel.org/en/latest/
>
> Konrad

Thanks for the review. Agreed. Posting shortly.

--
Best Regards,
Wei Deng
