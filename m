Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57642421880
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782829110; cv=none; b=XpArvFLc7Mpk9Un8C04lCaApaaWdzTki8XsnD7rHMuJEpl9ffvZ+axXYORvJaHmEiD7LU6Kga8u62rToEKVcIdffYiYN0Mnp0XP51JoHFP3QdodSmwr3rDRUkD2D9LpNJ03tLMd7Ke4Cjl36jNXgTHOgJaG90YWo+z6h8R0xbGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782829110; c=relaxed/simple;
	bh=fuqUYcg8JyTJO77tUbShVZbGD6Q8Y0SM/8Do+nLvQAI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CbtIEGKWQImT2upyskJfu//qIZY/1KmMAt5iVrv5/uj8vaub0AHoRDjFCrDbkG072i/LgyLaFiT5BOHMWV8m2Jgph4n4i+Y3wI3X92Ip7KF6fpn/jrgZHZFJqvO31KrXLm9T1NVJSnof8ddvHLOVFUVSvfczpfN1lEqxL+3+SL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmyoA9Rv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XRsW1NBg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmyoA9Rv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XRsW1NBg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65UEDHn02149120
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=; b=BmyoA9RvOmEyPSGz
	4DdeycYqRg5PCw4Sxn8ZYj5d67/KDrOpCaGBDY7TZ6s+x+WiyiRV5ePHES5IeqAK
	iL/+cW5LWLx0rzSbXefMMWSHzBSI5/IOPq53z8xX3tPJna3JcK6LjNBY7bg2y02W
	oFJA+JjUPagK07YIJMMFCeoStdq9cTIDDQttRK5oFLySxr10PgFXYz7FmSNRfDfv
	sdmrYhSaQ5SpRlduvX6+DHOce0hqZxJV/ZC/MM843ibdoKzmO+WJ29Bv1o93F4jP
	OBn6Hu+ZqZ/NcLUMXU4xtxQ0MuNoEEjTvB5d7Z3xxODCim5c4aiadSyvKaR7lQzu
	/yyDoQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f44wp2w87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 14:18:28 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0a27ad86so11622041eec.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782829108; x=1783433908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=;
        b=XRsW1NBgKORvbnLJBs6xKBUrFmVoS4ELibiBrJ2sHlEFRFekdaiEXaLxLpvPbPlA/w
         lEJprpq3cLCmdwNfcPdovtZO6NKUaRzZKUqa3haFR3YI0CEzabRvuJ1P2n7c0mJ6QNUB
         6XhLt5RERvBOATWGbl8gUGOiWGicn0yyFag8ezk/YlD3o5GqY1lL97ACrtyRihhIKaby
         OCffsB/q2MOhIp4cVPFQP2OAFfbBdr3oYEc0ZfFtKUL/0iBsN/aCrb+h1x7EajB2aRAO
         j+u6uwNQ14Al29tjXQl3PNkVRHa5jkt8HkMlbHw8rByRJi13tk+ft6aM/2ksXQxwd9W9
         lRqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782829108; x=1783433908;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IG0h16TPXM/brEFoRwskxJmKMoE8Kp3fTWZsdFNMAH8=;
        b=A33HgbaOQhZtf9cRTfnpUngvqNUvfEx4cAdJnm//7AEJoZvQiwztYA6AkZrpOVeuIZ
         0gbl6JQyYZmWjw7/0Gqj1b5sXZ78Jdq9n18j/e+FpgNu4Kn9VL0NqT7fb8ivSkNxkMPw
         XUMU9bL/ySdKLaOhV2caL0DYwaj0CiHJa2vDWDIkuGKYhApy0pHFEI/3q47xtCj5Q/cG
         CLdjVPvWtLk0+9Mzb4sXLTC76j0y2/Unq+jA0Bz2RMtwjo2BqhS3y5+qEZVkrpj7C8yC
         qDcVTHqEi9U7JAX3B8O/OuciQWCPAZQ0asZK7zjGR7wNb/PxgcGNdEcEIrNizcFvuxDb
         viBQ==
X-Forwarded-Encrypted: i=1; AHgh+RqVwzBcmmIyfa3aleOGJSSpwFozw3g+E/CXmiZVxb1hRix+fkRa8ZfHtKaAciqME6ceCyReGu3aMVyB@vger.kernel.org
X-Gm-Message-State: AOJu0YwCJvV2Y/MxPXfESVTBn18hYpiIURY4M+9gYsPK5xkgC9Y/ROBH
	hVyRTuBA9GxEHlezgomJnqEgmlTGCcCtZqwd8MBFxe+u+aYeVRBDS3Qz/bg4qWEANeKvaB2+myW
	uQuVxNwV2mQF7L2SfoyYKsex0QCIx1n/hFyBl8HNzsrmW4c+oaRGhTZ8FHugNXTTZ
X-Gm-Gg: AfdE7cmdaukOs5zuuQOGJL7eN0XQWduSaNTllfXDoxop+LNxAKSkE1pIBCi/B05Babw
	UqGo5D4aC6bTnbtn/MiHMYSfldnA1F9gXjT/2BVSqMHJCiasWSsMGvV7C16wY/p6MDg2INA9fhD
	X6dqHM1+DkKaQa6l789VaU6dPW5WHxj4Zte0G2/j8FXEBdsvYpA/NvirQPvI6kdgZo6mE7onOMB
	57cJysbJPIItqicdp1/Zm9gkdvQ0+WODccdtSlvcwdD9q9AtSWrojh7un9XX5KCshtITRVM3n+v
	T6IYIzyPQGUuBG9wgYEc49SyAerRZNmpjss5srNvXv7E+OBk042GahIiw2kSbMqrmXmN7NtYhJb
	87SqRHdNAsKR2ffl1gJreLj8ZCU3Gcw==
X-Received: by 2002:a05:7300:f691:b0:30e:c1df:4592 with SMTP id 5a478bee46e88-30ee149bf8fmr3700857eec.34.1782829107798;
        Tue, 30 Jun 2026 07:18:27 -0700 (PDT)
X-Received: by 2002:a05:7300:f691:b0:30e:c1df:4592 with SMTP id 5a478bee46e88-30ee149bf8fmr3700817eec.34.1782829107056;
        Tue, 30 Jun 2026 07:18:27 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.60.61.127])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3170ef9sm13888083eec.16.2026.06.30.07.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 07:18:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de,
        lpieralisi@kernel.org, kwilczynski@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com, hongxing.zhu@oss.nxp.com
Cc: linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
References: <20260618092100.3669556-1-hongxing.zhu@oss.nxp.com>
Subject: Re: (subset) [PATCH v7 0/3] Add root port reset to support link
 recovery
Message-Id: <178282909958.294720.13302580439189608628.b4-ty@b4>
Date: Tue, 30 Jun 2026 16:18:19 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: MtIRizv_PJukqIOlX30cSby_Qfjbt9c8
X-Authority-Analysis: v=2.4 cv=AtDeGu9P c=1 sm=1 tr=0 ts=6a43d034 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=H7IkG6lIOHbWVTtTQWLpKw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=8AirrxEcAAAA:8 a=ccIQWBWPPgp-iIgOqYMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: MtIRizv_PJukqIOlX30cSby_Qfjbt9c8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX2uFbmRzMg5hW
 K/yyggUCP1sHJuPz2lMKheLXnojgfvz5I526vLYyDCsjBqoDcTuutzz4DRFYWMgHaHovkliTSgC
 BMuq0WZ7octOqmeK7sidtKpHdQOweS8XwDpnX3eHy5L1pWLHJt5cW7TSbjBOU+gWlJTaPUk2cX0
 4U3EYULPTm0g/Z/1UB4sddSODO8AwyfuowUmQvKdiz0Q1vfKnbuNF8stKeVgh0RAZXPo90x+VLX
 ko0DFfmAAhqEjlDto+AvvmyNUDfb8Sh5FxIme+Sp3Mt6UwOJPXmrtyDFmN6noUp9oQTBmDBeTTX
 O+qyLOwcO0oWFdKM5RYvFEAw0GAKkXk8vpAgm/DG1PZ7W1uV9H03nm1t82PL2z+D8vlljf9li86
 NqlojuCepa48G2CVcjVJsI1eql0DQnAsqG3vDWLWBxF4lvLOUihTa6ss64dhe3ICEPniy9pzDlJ
 Ae9ihnjye2y/r+7T+/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEzMyBTYWx0ZWRfX/T1oOj4GzYWr
 FT+Ct/JW9w/4QI2HUtNw2Qwde3i97FzD76r1cl/h1inXoomaIAulqZfWc4Z0hfyzhodzJi1zfV7
 xk7nB24gVkb7n9LZDwm5D6gC02UUNxU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300133


On Thu, 18 Jun 2026 17:20:57 +0800, hongxing.zhu@oss.nxp.com wrote:
> Based on the following patch-set[1] issued by Mani.
> Add support for resetting the Root Port for i.MX PCIe to enable link recovery.
> 
> [1] [PATCH v8 0/5] PCI: Add support for resetting the Root Ports in a platform specific way
> 
> PCIe links can go down due to various unexpected circumstances. This patch series
> adds root port reset support for link recovery on i.MX PCIe controllers when the
> optional "intr" interrupt is present.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: imx6q-pcie: Add optional intr/aer/pme interrupts for i.MX95
      commit: 7186ac21201a9a408ae80fcbb9c985c959b3febc

Best regards,
-- 
மணிவண்ணன் சதாசிவம்


