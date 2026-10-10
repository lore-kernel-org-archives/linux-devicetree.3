Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6965E39184F
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 05:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791610409; cv=none; b=pCNckOta56UHl3rcaK2Nm1oEh5ZiUi/L0nJDQ37U2v3cTAvb1+v8sYlzyuoe/UCJHOwvSBnZNiZIsMQSW8igBCX2pNxeeXEAcz8t9w/2VtUX4i/IgOQ8gQqhxpVEbK+mvWPF4uJm/3OZuw44zfIjWDwilb7RJD8zR6V5pSrOdZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791610409; c=relaxed/simple;
	bh=x0/MmR3U1Qe039ShKl3bSrAj4sEJ+mB5eel+HMTpPok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MWBkZn8gUIdIWjofIfHiMkg3dj/bi+o9DCL/R3aBgzWqcB2NwFT4FJ+1TEYo3OZS3BPHeA6kg+sPntCvsWWp7S3iInTLjWC3mbCg+xvc6IxKRNfnSTHTm7qb/Ux+V7pZW//+DQEBjZZMr4sR/F6PCI8q+jvE7KLInMUm5bXFkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=paLoUpNM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haFYflKQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="paLoUpNM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haFYflKQ"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69A2eRvR3281572
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 05:33:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vMX5mTiEmVP
	Eae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=; b=paLoUpNMQX48VlNL4a25zTFLzzQ
	yi6FQkYcsAqA+tFnCW2dzqzxgB80Hop9AafeaB4Pc5JzeERUtkbrQWm2Ri/gcBXZ
	vvMDEjKfXwRbkd8ssSOi5cqZYeMif2dhXoBq85s+HFcuHdvcO2vnBPp9lqCMQzti
	12JtatxoXJN2i30C2KibIMmRThToTSo8avx9uFvFdeXPyT8tr0bk90DW0yYSh+/a
	88GFs7MsWMw52KEb1hypp0Myu7NYFV7YGtgecptGt85mKrrODkz8sWiypxBGfqeV
	Qf4mrm97hv1A0QDA8hc/9Guw/+s2T2OCdnD1ZLlvyy8WHv2ZFHSJaSjDdZQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cpggbgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 10 Oct 2026 05:33:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-868db1b2c64so231005b3a.3
        for <devicetree@vger.kernel.org>; Fri, 09 Oct 2026 22:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791610406; x=1792215206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=haFYflKQGivc9vb85l25MfffqbyckW3KWpJCzY9RVrqp4Ac9y1HW6lFKISGWauBP07
         Xw+zz10ZQHcQjdSqmTCWFDjoz00M9vyXOseqWVpZmatbzUPkNVw5xSX+o4P9PgngTUuM
         bdVLVP2suBoDV8ZJ5SXJhyrgc8P1/6ONdOrw44gTrMKPKgCPtQpFlWnMDNMVFrU9uYMw
         lgQP/GSyjPdbEJj3NQ9WCMP9d+ItCOzUuUzq19ewoSBrL7uM7N9JgCMYEFIDdsClmlNe
         WNc9Iz+XLWOBaCeaX7TQAPBea70sMsh1wUvMyvchH9s+Skv8AxBu1J4DxAsO37i9L4q6
         3KdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791610406; x=1792215206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vMX5mTiEmVPEae42SGxRrCbV5MbLOwL4Pvczu0/B5mM=;
        b=X58xUr9UPi/zvKscd/ruC3VRzBzqOVG8j/Rf+1D8R2iO9CpDYc+y6SHUxPboBfRbu5
         h1kyLVqWRUlSA413duobGW5fQfSx/IBVPvMYEuPPE/+zk8tt/VJD40bjI5xRVi2G/0jR
         iStH9TKZhhJcEktVLMt/aDDdD01FwqS7g01KAN6OtWSAYopoNx/CYHVfpAcjCju9XgVg
         BPe3H6Dttf/3N8yiM54DW2FX1/FL58aNFmgtVO44wHxn1mRxeXEipI4VbAyKxARuX/BC
         HNQzc1Y/DKK75rhHFpHu7j53V0//B3TlE46hBBUvU44zvGaBCO4AwZLSmMpyFxSkx1lI
         sldw==
X-Forwarded-Encrypted: i=1; AKwUvBzeoRbUiahDdYmLU0cUZZDXzdvPaXEfsdHN+jHdbPeTimui6F32Pn8yBQ/lEMBXOkwNcQsupB0Pvqi1@vger.kernel.org
X-Gm-Message-State: AFq9FYKfAlnfWFfb396+C37sY6C6vnOxXndpYz1kht0vuOvUictNJExZ
	JMM4JX3mXer9cgy4qU/lyiW9D3ulqcFOjewAw9Ik5xXF+ysuqoSE8nj96+qx+s8Xmrxm8lM5dyp
	fM/uYB/aFPQCq6J9mq+B65DKFEU/j5NlGC5GFn6jJJW7tx/hmXv/QNGOvJ/8IQI/p
X-Gm-Gg: AYBFou2pKOHrkD8AHhfaOboLvX7B7V5MeMmpkmHvh+VFXgm/n4jaOi9x87ZS+KhpW98
	vymvSkJCYrBPcdFsSXOWFlzj0ZdMR80Gy5JytaLQ9goA5a2zaBKi2F8AMLhD2s/VorfH6ANrZTM
	/fU6osgUo81ZGc/dNEFAQq6FuEdojEPsQaIvxncbEmAuAg4oZI9oX58CA0wy58o3gTO5c994pxS
	FS4F4X7jQC6bUw03u/Gz/tXQNQPeJz/eAfCZgcQSfdV65uCtOhZaHQBUVNBrnFaQ1aPqBXshI8+
	8CCXd8ZWYYWdT2g3wq6BUqNvnSdLllvWMOEriHIlAb7juIWFG7b4udme28elTL95MwpIcRaroDR
	SKlAEK6RxLlLjPu+bTZd5Y5NlHI3r+d4=
X-Received: by 2002:a05:6a00:3006:b0:874:705d:f653 with SMTP id d2e1a72fcca58-897c6931e70mr3242248b3a.33.1791610406341;
        Fri, 09 Oct 2026 22:33:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:3006:b0:874:705d:f653 with SMTP id d2e1a72fcca58-897c6931e70mr3242231b3a.33.1791610405915;
        Fri, 09 Oct 2026 22:33:25 -0700 (PDT)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89928fd8469sm174028b3a.61.2026.10.09.22.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 22:33:25 -0700 (PDT)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        mathias.nyman@intel.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, p.zabel@pengutronix.de,
        wesley.cheng@oss.qualcomm.com
Cc: sriram.dash@oss.qualcomm.com, jack.pham@oss.qualcomm.com,
        krishna.kurapati@oss.qualcomm.com, shazad.hussain@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: [PATCH v3 4/7] usb: host: xhci-plat: Support XHCI_RESET_ON_RESUME via device property
Date: Sat, 10 Oct 2026 11:02:43 +0530
Message-Id: <20261010053246.2991984-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
References: <20261010053246.2991984-1-faisal.hassan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX1suYukA41DCB
 DjA8SL0nUjv2KLqzmXEZYWKxdZXJJPCrKUouplqIScR7PxExzhQMxKQgVx9pJur+YD3kAjo+vNv
 eIHB7QKgGOsio0NqJvaKK1j1ZQf0XqI=
X-Authority-Analysis: v=2.4 cv=StoFe/O0 c=1 sm=1 tr=0 ts=6ac9ce27 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=A6Vjp3zFaTA1NjdqV2IA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: 5OVmYSeL7zbz_YH_3GqXv_3WTqXqnIk3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDAyMSBTYWx0ZWRfX+jxJBM7UGT3A
 TmMycCiShWBPaGT/+nTTp6cFYkNQeVEgsioWPK/Bh9bxpiogIQkYl6fuKkeX4zMk0/Ave6hs/gF
 HW90lyYBnka3gsYcf25ILnVCsq2JL1x2NAvl1wWUNUJxq7ij3LVIienE0actU+WvGU5eed11Nc4
 T35Umi2QTrcXvK3dsXRp16CEINtoLLc8b1bs+E1xn1qrUcf8G3d3zRGoPjrj4kivNQsYTe1BRhg
 L8iSYaLFzehTThJIBKa5h/rH7BEiWWmJFj1Q27L8iYckOSGHiWZzp5pe08x21gsUcrrIJZzE/Ie
 Mf69ZO/zb+CbSDP9Kw4W7KjikjW4VvLkNXOToEzh3nx9ywUCeOJhqoArR93NaXL66plj0cowrWb
 ftX9as1qPGH2ivZlfns66MinaaKJghuNJEWPwgE6ISmjyVrUbB951EnO4o71pM8MyMKY5MTB29y
 92IqNxEQmp68AXdbK8Q==
X-Proofpoint-GUID: 5OVmYSeL7zbz_YH_3GqXv_3WTqXqnIk3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100021

When the USB controller loses power during PM suspend (as occurs
on targets like SA8255P that fully power off the controller),
it generates a Host Controller Error (HCE) on resume requiring
full reinitialization. This is handled by the XHCI_RESET_ON_RESUME
quirk (introduced upstream in 8b328f8002bc).

Read the "xhci-reset-on-resume-quirk" device property to set
XHCI_RESET_ON_RESUME. This allows parent drivers (e.g., dwc3)
to enable the quirk via software nodes.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
---
 drivers/usb/host/xhci-plat.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
index 6fd595f81a30..0093ed24ac3f 100644
--- a/drivers/usb/host/xhci-plat.c
+++ b/drivers/usb/host/xhci-plat.c
@@ -277,6 +277,9 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
 		if (device_property_read_bool(tmpdev, "xhci-skip-phy-init-quirk"))
 			xhci->quirks |= XHCI_SKIP_PHY_INIT;
 
+		if (device_property_read_bool(tmpdev, "xhci-reset-on-resume-quirk"))
+			xhci->quirks |= XHCI_RESET_ON_RESUME;
+
 		device_property_read_u32(tmpdev, "imod-interval-ns",
 					 &xhci->imod_interval);
 		device_property_read_u16(tmpdev, "num-hc-interrupters",
-- 
2.34.1

