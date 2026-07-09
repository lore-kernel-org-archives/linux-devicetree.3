Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2DF33E9F95
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584769; cv=none; b=a06yuTBt1YL8xOzQ4+uIyg/MMQ8GKiw43BVDQkGOSeozX2z87yQ6LpshhKYr05xOEFapwEcBPwzn2Rrxx83OYeX1uWGwL7Sjfr3tyTAed0TSIXEIvTRuzlDF5wwIstAtJjQDvmKIDzt31mBMqXsRUhJRCydt6zPdG4DplbOaYXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584769; c=relaxed/simple;
	bh=niKygPrLJDSVAAD++px275RNa9zTNKh6KuMMtjoQ10Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g5TQDHdl73IhUz+whGEBJlNjmsc3vkNucKeLv4Y1sBx1fJcwY6BcqxmIco/ZgjQQB79Nh7j7fUo3X8rRZ9MtJ7NM7dsaUeOiouV4b6ez6pTbt/k4mOCFibTKB4jqS7r9IcTdruUU3Ea9jeb4zlNBHvOBTbSWQ76fffN3U8cOL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0FIk1WH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R20XTesd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0FIk1WH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R20XTesd"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960a8v837432
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:12:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NnyUzY7/I91
	fQnA2ocfZbXoRwelCNf8o4yij2RikmG0=; b=R0FIk1WHWr9AfzcZCDwPs0mY+eZ
	BQ6DKnYMTR0161gxj4edxcGmSp1c/l90F1Yli3GHyaUaH0IKmb8pwkM+waAI3Js0
	KJYz+4rOz2XnITBMLRE5kvpqor3qjwCq5ApsQE+oZ+wfH9WfCWEBeMWmYEU6poRk
	FRLvGu4l+AS6ck9i6oLbVBVYD7nMFuKzDcTlJyJSwUwp+B8ATv7ZRtuaGFKpzW2l
	CXclkbWQ9A25Obyo49HNq17p4s9mUzRygUJSE3hTZT4arDSsT/fUnKouYkUZPWbl
	poEd04g2k3x0vHjSbaDBr/fnSZod4bHl3IiJ5FsSQ5/y69wB1ca9CYeG4cA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9sqwb41v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:12:45 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8484513ec19so414777b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584765; x=1784189565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnyUzY7/I91fQnA2ocfZbXoRwelCNf8o4yij2RikmG0=;
        b=R20XTesdTBH3Usq8OxPzX/CpySdpJSQ+v/ha65CFZ4QhKsynuMNJPK06z8fXXa47E9
         43GEgxshiC7Zn3eJ1dirQ/MDVA1nxZQol4s9gPeuHiKASAJxMKkp8+DDfehJ3TutPSD5
         zeUYeY3Yky5u+7g2d5wzgFsBGRUuF7SmmdqGx9F6YxI2t3Wd+O1s6QY8zRNhYp6HQLBk
         b3n7fVPK+VMUjF2bjhPFNZdJ1L/eILayTwBd/21DOXXA+RnFv8QpD/8hBSsbj2MRzpED
         p5n/ZC7AKVR5y01kLcQZYBc9NtJXRQuEIv89BI/Z+UitXgqeunmElJYCyVobJqEmgeu0
         JQzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584765; x=1784189565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NnyUzY7/I91fQnA2ocfZbXoRwelCNf8o4yij2RikmG0=;
        b=NMVQmZjmqQJpk/NVSfYOqjYKPX1isYkTih7E3w/EMELEJ0FqVPpn+ts1i7OuzNDrPs
         XwvOSAwwbRjHeJ6M0e+iHqf78xO/ai7LwpeAZz4T6ei7IKsjDomK2ZG3hL2SmenAQ79A
         KTiWUVcR5FFkDWLV2cD0hkfgsm/Srdmn74sKuErSuG5v1yq/WgCwZx9ZRwUziVs+w0aT
         Bgmo+dRgWDWiH2scYaXgKnLKUv8IBLJLUqnj1esRj/3sN75Kq4ImYsGYWEoBxm/xfB80
         X6GM/Z06Crr/j91c7mNpzvL/nN2PrZ0KuPeyZxrDA3GHgqj3/DMEYIiEjUx4cvMRRPwa
         jCaA==
X-Forwarded-Encrypted: i=1; AHgh+RpiL3nb6ZR6q68gP7OslK6ufzkmLzI4PAInPhHpk+gkY3Wv4l4PiFm4IzsKNp/cTmQopfvKlutdh41d@vger.kernel.org
X-Gm-Message-State: AOJu0YwD3BL1p8JpDnjUjk8k1wdtKzy8LXprfuvy7SEvin9w9V2fem9u
	Us05dT5/G4SgvJlWVcu4kDg0FQYdmLMH87lqb2oUa7iBSsvEG0oBLEgi/YqCsb5/0qImtI8UqQF
	e/V4v1NjhvJ0JYM6RtTFtwWeJOWfznaRgNYt4s3JQJEdj/LvLmiBFBBUna7PgXi+Bdsa/ynH1t/
	k=
X-Gm-Gg: AfdE7cmLh0jI6FlURbTpk8XyHEzN41EeoYfd4sxzBc5c9zRQlyt/pswIeALbrUm/V4t
	KKD8hPaT/172c6P2dFBcq17Ft2cnXxnVdOhh66gngnJAyr53J1OIodChAMWkVp3VfpWGHpMzjfn
	61v4KEQcIXWVKXe5cJl939wedCRVeQLS/HTiUsSJuaguG6rJFFXMMRSX3MAP7evjOgNXRxTrez5
	qVtS5MN087J67jNwT5q17Pq2oJMdBHENhwR/5X9Zj9mdT65IgFAdNpisKmg798SkY2XeJBT8wxA
	kZmHZ+iPTtx06zciAv9gTQwtazUdPfzSb5u+pWaOySLH+EPnNb4PWCgdMOC4JpAt37Hobkq3wik
	EzVmiQdhvN2G85MXaAwi3CF0IWKSbH+Cb3cMEcbHMTu8V6kTOn7byQtAi8qoJTg==
X-Received: by 2002:a05:6a00:7702:b0:848:5c3a:14a6 with SMTP id d2e1a72fcca58-8485c3a1a3amr1077861b3a.6.1783584764652;
        Thu, 09 Jul 2026 01:12:44 -0700 (PDT)
X-Received: by 2002:a05:6a00:7702:b0:848:5c3a:14a6 with SMTP id d2e1a72fcca58-8485c3a1a3amr1077840b3a.6.1783584764224;
        Thu, 09 Jul 2026 01:12:44 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84848939b38sm1937292b3a.10.2026.07.09.01.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:12:43 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        brgl@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH 0/3] power: sequencing: pcie-m2: Enable USB/UART BT coexistence on Hamoa EVK
Date: Thu,  9 Jul 2026 13:42:38 +0530
Message-Id: <20260709081238.421905-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <drwgkj27gdstulk47cev2nxs6icienfa6vb3tu2uc2gqkbeedh@duj252fcm3bz>
References: <drwgkj27gdstulk47cev2nxs6icienfa6vb3tu2uc2gqkbeedh@duj252fcm3bz>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfX7g2Zm51o7xRx
 dmn1eVXz2p8hoLvoL7OtUTuYWgjIPIEXyTPx/EswgIFlSpxgi7rKLDW3E4wD8bmi+FOOi/YzQrN
 XZE3k3XucZqVjU2QzhhdMm0/LBwZaTd896Lx5ZhCaFCkjSaFLJ9vRfwFXFAnH4hnb3mNLJVHNKb
 rY2CwlIUt4gcrgHctF2dAqh3lPPjOqO3nY10AWt+n/hYKmp6z7Qmm9w6l1KBpBr9W3iPYmwCHYu
 Dqr880vKChoNLJJfR1ueKE+XD/X5awl2ogDXazOaQSv/gjFN2XicaktFeqnTjBuxcmAkdZaUzMt
 s2dOzvK8323Nu+txsqWDF0kq3EBOvNqV5U5ZC1Pt31KSDointcPbB19DUON+ueHXlUQnaS3hmTv
 d7eIXoP/VF2QLNTkcYseleaHDSC94EF+PFk2UnmB6lLRWSZUxWZNLdB4yVlg51iFGi1qHBvUFvB
 gb99imTlAAXJkEmrZ+w==
X-Proofpoint-GUID: T4XHylcw9BwmGlDdjtm-m6fo7Dgor4gl
X-Authority-Analysis: v=2.4 cv=fMIJG5ae c=1 sm=1 tr=0 ts=6a4f57fd cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=XXUDAU8s_W5M1BeKZ3IA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: T4XHylcw9BwmGlDdjtm-m6fo7Dgor4gl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfX/Vz2gn/Uoo1T
 +Qp7JXbPsCGrGZw+eHPo5NQ3HjFe1ad2RwDe59gnLG6EZc4IbKLBsnM6tYSt1kFRTttDe/3Bmw6
 23c12hmQ7rBB2Ra8FDTR6pElM4q59zU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090076

On Thu, 9 Jul 2026, Dmitry Baryshkov wrote:
> What are the dependencies between patches?

Patches 2 and 3 are ordered: patch 2 narrows the table to UART-only
sub-IDs, which patch 3 depends on.

Patch 1 functionally depends on patches 2 and 3: USB M.2 BT will not
work on the Hamoa EVK without them.

-- 
Best Regards,
Wei Deng
