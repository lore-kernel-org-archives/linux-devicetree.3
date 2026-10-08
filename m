Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189A73C4169
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442055; cv=none; b=iD+IyBeeRxLx4quBUaseWzbld1fQj/iRlwNx8lqgpkO8ZdtoQQ6jJxSM9H/59gYVm/K0wClMNbH9YCsNhzK8Mpjd03nwZhCzO7J+Yx3qutyKGonG1dzROdx4gjG1YzzLkxVMLAp5S1zGn6bcvHbHb9tUIprNnj6UUPerXaepo9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442055; c=relaxed/simple;
	bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c4WCtegzcg3niXERTKs3HOX6LiialbZlzVqc4A0LqeXtTBMibLb4VCWdd57u7de4/SAVxGbABYHo5rMhOXo4NqfqXAdZCKPopD+hYOl3w0UF2W3VCnQPrYXu4w735ZE6rbUMpA7DiM3L71ihs/zZTzzZkMm5pmVfnOSdJacSVPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pck4sEto; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PduVV/OS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pck4sEto";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PduVV/OS"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BZaZ313853
	for <devicetree@vger.kernel.org>; Thu, 8 Oct 2026 06:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=; b=pck4sEtouPHply+j
	N4rqGchia3wA0pQadXpMbBUeZqsKdaVnQXkpJiq7/Uhvogo/0VbIcNACedUfB3tY
	1zGnNcXUNnE7hYFbKU+HCyw+p8q5VhpWb6+KylcZHGpKTquJwDl//J6q/CmN5C8N
	49s3yh6IrwMhqJcXgptFn96A2sP7uA3XLWU3C0roLx5R2AtiXLajIrVKrEj1HVhw
	h/gO178lgx6HTI5EaG/460XCHqcgWx/bCATgEYHWItlDttz4CONRtfoh13wuAyXl
	5DvBHmCQv6XXr4FXRCiGisUgfKiod9UPpqVyUDUlOBjvG35XOzWUebJPkmBMhKg3
	yZmGlA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe31fyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 08 Oct 2026 06:47:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso5444962a91.2
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 23:47:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442053; x=1792046853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=PduVV/OS0qnaE256IoaMenlugQOCVtstazZAzcBPaEOW4PFvy4+JIc7meDGo77HfoO
         fgkNRoS+NicobC146Egxw8Hftx/+/Sy+JtdxLQn6AtDzBJ2ZJ1zJAcCPgxnwSStfZw6G
         e1vTU7mWbM9JaBPmMccwYhN6to1ijEMBT17d/aIdnvGhkVuinJ6CQqsmQOFgTLxYxf+w
         yojdelAXr4ZLe0OGUZLjFQnPdH/o94uS0baNSRFDl6KMj/kQm3xXo2K4up+VqphxA8kl
         KsodHcspZKf/gObI5RQJIXk7TK6572e8/rut+MhVGfbBA5bSGkkJXFij1b4ZWfmV1utl
         nHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442053; x=1792046853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtciI2dXuSRKP7znBi6/ImEi5cWqof1ckcMtFCHtuf8=;
        b=VZ0Aar2d9Q+tV9sq3d98Yp1nDvp5QR5zfCJGQpn5OQlO0opdwcJiblZLHh5gdSCb/v
         qmznu+pbJ2YA0BCRs2F0s6dx689PYDwJ0ql51GhzPOkEBmHc5NsK9HElVuXeUAzVxy7W
         77qGujxtU12URd8OleOniS2U8FfTQ/7d0iX1XDoXSLdF+UhwxwpOza4/aypyaUQLdGm/
         Ji04AOdJXwKhmL9GR9T87M7cz+VLYb/UeI3WEF3CsUYk5XN7yev+0ggFhK89qXkthEK4
         mmu8FogD9f0MDDrKb6QfGiamhXSqK3TOKPXyG3O8A5TGNOepDXjQ5oVF1/6RzXzFtwSi
         gSvA==
X-Forwarded-Encrypted: i=1; AKwUvBzxbjYkbXDU8ZZM7gMgL3ZnqMNoCFIUyVjka1dFK0LOdxFRRThGe+g9nV37LgfCcJZQdci8TMVGxYgL@vger.kernel.org
X-Gm-Message-State: AFq9FYL72UPgCrLQOAxFFGGplHxyzpfmXq9wXfyLjKci6t1bpfrWSAbz
	+NToQleSIZL8K7Ew9dRJrSzcasxvU/7v7ZJsxn0qrJcJh+CArJ4KxBN2e2kRLxTchePksQ27jhB
	qs4RsdGH6983kEBOywnYv2qi0Yp7Z4GMRh7EhoF6rvQMhFiDdAQHIV7rvo9SUnpDG
X-Gm-Gg: AYBFou2ANj30GU3OmRaU+L0YRtiZ0zVXQjTQLhe2n+v2Zj7zEnHQ81p5ee2ZqptcQek
	64+elSYu9sIgect8S/ydX1KZe3ttGyQT55OLgDeuQFxGrhoaNYygOON2GFm/vTrJp99qE2j14OZ
	6Od4iGtxlD4l3tq4YJjJqYbVtfgrRy7gBXYI7HolN48ubj1zAX/Zzwb3mz8EdRhnHEU+NcyW9wo
	XmYMsGY3do5NqRfMfkJi82fqBd+AlAs5DxEBYADquNKzz8az/vvgESm2YYOL5lbbJ6ik7JcVp0y
	kb1mc4JfOva+WRTBuvw39/31wJRNoLxqt3TSyGyvwUUbL2EShpzRA82KYyWjgxBB4lj2h18vaqO
	q7DaVG0EKlqtSpieRELXyRRtRPES12MjmUkLUm9i5EKMZgRCP6TsabNA=
X-Received: by 2002:a17:90b:4fc5:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3a8a1982a7fmr4138280a91.10.1791442052683;
        Wed, 07 Oct 2026 23:47:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc5:b0:3a6:dc2f:f07f with SMTP id 98e67ed59e1d1-3a8a1982a7fmr4138265a91.10.1791442052227;
        Wed, 07 Oct 2026 23:47:32 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:31 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:11 +0800
Subject: [PATCH v3 2/8] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-2-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442021; l=1748;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=1/dwipsmDrfzLit921IQVdk2VPlf3+aUAoUuV6A273g=;
 b=+oEui8TWP9g+43keyW0RGKQR6one1M7JZqzaByeLJ26nfwJu/nWDLI2OcGMGJDG+gftRieh+t
 2ePmuc/bBELDbzzZnDigIUCwoY0oUrx1oo5x6KBw/akurJKSrEEEgwy
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX2F5SqOsRQTEq
 Spws3kJcmRS3GKaoiD+MQbs5EtDM1+IMn/Bnh9+38QvDT4tNYTF1T7huTnzF53/63sXw3WrY7Ca
 Dd+emt0GaGIHaYAf78Gp9LrGD58xL+9da8AYfrjB+73br05qjNfC9c47KtBO6S2RDGx/ZXsSlB1
 EX3ao2qJyAIouBSzWSsuilpgi29DJvAhyncexKNk1Vb1UiJgldI1cGOkPsiX6mZupOXsUR48APV
 1ufytDTkoK8boLkx22qmMX/bRMoodaBR9sUpAiMPILzeQoJIWH1pwOBsluDLuydYsn8lnPXT58w
 +AVDy89E5tc+WIarTjekSs6ruwjT9qqBCcIIDkC/zr6QW0oHGUyK5gbnRObuFCN9z7aWbZQG/ae
 xbdI9OAJvML31MDhG4IDHfS1K50wpfMV224MSB/DUxOOHOm6iLVVkSE2wIVQ2dKpqzbzIEM7w1s
 4KF/n2KYc3+BdEqlf1Q==
X-Proofpoint-ORIG-GUID: QRg-RjcRMg7hsaRLFyU3fIXpOi74ha47
X-Proofpoint-GUID: QRg-RjcRMg7hsaRLFyU3fIXpOi74ha47
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfX7PjPK1/ifFOn
 fuNfzA96fAVa2+bb2ybxl9rQ3RBOyrA7UsKH+WHDp0goiksUd1CDL6pnAliW444dKf3NjsQUqpg
 RQKIKn1iaaedpxkGWhDl6MexpAkArzg=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac73c85 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=s3E7sL18FQBPR4dFS-QA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

struct resource uses an inclusive end address, so the window size is
end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
which is one byte too small.

mapped_hwpage_sz is used by the register access bounds checks, which
have the form "offset + width > mapped_hwpage_sz". With the size one
byte too small, an access to the last register in the window is
incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.

Use resource_size() so the size is correct. The ">" bounds checks are
correct as-is once the size is accurate and are left unchanged.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Ben Horgan <ben.horgan@arm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 6da217abf689..c68135ee0ffc 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2095,7 +2095,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else {
 		return ERR_PTR(-EINVAL);

-- 
2.34.1

