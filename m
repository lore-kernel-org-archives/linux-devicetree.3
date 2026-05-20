Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90683DA5CC
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779274916; cv=none; b=IxydwV7fwJUFu+XI95plsaHMdG8juKoYQUjHKyl+uhX3ZT9VjTe2Q8EX4a0yqcTtl7IBLM1IW/3Kwfwlc19mKjqTXi4o1laDfeJfKyWogrBbkxpkB9dWtJJyYtnIzue91Rm1ZmyqGwsG3LleRD4wx4SDmCCl1PEQ6IHWYjuj9dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779274916; c=relaxed/simple;
	bh=rZymK6zMzN6GZk8l3iT4DzVoSNYOOdaK8F6aD8UoJlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIhZMgt7GFSQTtx5JM0oJdqEBedRTmTNWkNvsR3lHlI9YR1jE7F9ut5CGtbLnmqPaTc/YfmHcgN4PpEDtZtTw25z3v4od5V+CblehTxBgsHBZqHzWBbR34qC0YaC9POs/nLJFB8tJKhf2Xnwcy62rgu9QBmV7ZeuI+pbsDdRBnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ic0TwDnK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQ158O1G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ic0TwDnK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQ158O1G"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K8ufU44115208
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LKHvX6tqS/qImne6H2K8InjGHU4hq+riBpBr5o2VuU4=; b=ic0TwDnKzGanOxm5
	RbcpsQH0HAe5ZyWQRw7sqVkw05bJ+keqYSJF2LZDUc6SQrd5Pwb/CEneMHcEIr+J
	x1bq4G9NB/clpxvTodj59FWElxGKva/PgvoPuCCZ9DsXE02i4Sf+SA7O9NLWN+R6
	GG/UQv7IWNLQb8mroFMNB+Bu7e8r5tfGM6EhMRSm5CgR2cb+NRXtN1LmJatz5le2
	f7S44CYXaxYFRoH03VQHlHeGtqfPhvlkAqybNlcn99kTYkGbwlW+h18qxNj59yq7
	INlLVB/6UNBRmv2LJn3uUR6ADnKv0ED4YOEeQRcoxICLOz/Og6sJ6aW8bnZyaobG
	EjEC/Q==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e99w0gf7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 11:01:53 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6963482e03dso5844933eaf.3
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779274913; x=1779879713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LKHvX6tqS/qImne6H2K8InjGHU4hq+riBpBr5o2VuU4=;
        b=NQ158O1GLbsm+1ILC7kZ4nTfwcE9JY6TqcmEOjjTDPuu60ZibZfWAIg/7DzVyPu/lg
         KeXweem6vmnqQmMkr/9qJtecbYYy9EnQTSjD1uMAK/d5DtxuFmtB1U+UR1NUBqBJrAAE
         8wyLbLjjCSWcSxKLHU1X7JGXBXkLIHg2CrEccQjxeDR1KNNxh4uBuWj8wq80UplF+I8L
         JDW4v6VKHOuzDl0La6Hr+78skH8/Jc0hgx4jR//1AcrLm/gfohx2c30Z/y8Ggl6hhj04
         GMEFk7vPSi4B5wLGgQQmLYbsVL4cJFXELKPdDjtxKJUx3nv2bKAk14703Y2eAcX74S8B
         iWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779274913; x=1779879713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LKHvX6tqS/qImne6H2K8InjGHU4hq+riBpBr5o2VuU4=;
        b=UUzI/V8xT495lAWqNhnT66RVhE0LxTAmi8rrHGBtp7Lg4dQXyJtFm23PHG3Kd2UoaI
         8BNhOY5yIsNfHYWXBxjL3p27KzVrVjX0BRfQgF6mHTxRzXEU+xPM4TS2wIeZgAuEyjO6
         LjImw+btG0xFx/RZLw7kYaJULj56crO73aNMF2/mRy89xXGBPFfBzPP4DIlPrw5p30Jf
         VoH1Vh+HrJ7PMB0Z/535YnfD6xJwYD/DQg80kjI30Hp68DoXxxWkx5KpYEME20BGp81b
         D/JJNE0HZL0ZdZTKqRi1zjYBsyU7rLW8jr5SzX069zsNtFPaoaizvy6V2Hjq5A00zvat
         Bj/w==
X-Forwarded-Encrypted: i=1; AFNElJ/9ERw6u1cLRwCMK12mu19b3g3CMcCwl6KXM67S/9zt1XydlRyMio6LmDFInh5cxqRKg2XA6XK33HFM@vger.kernel.org
X-Gm-Message-State: AOJu0YwLAOP6+wu1ERCcK2nqNhtzQXrbCV8bTgfSuQqzVUDWFYZ0qZsM
	oa1Dxt4TNfZ5D+0JZnXWrV65t70hC9ZjWkbV7sw0cMUp8J7iPS54Elb4pv2IsWAvUuAv3EHUIiX
	Dsjq8BAmIHPULnOsoj+3v4LtP6RjfBbqvkw4KaYqTTIVsgZ7K0oB3RzIBbbmkotIO5kcBf+wb
X-Gm-Gg: Acq92OGablMrUiTcBqhTusOVlyMZ2kH1Hx/3iacaX2pFrPBjqmGFk/XdJ3YSw35wRsg
	rYjPRHn2WYz9bDUtDaJAAPR3KxsMw7pUE+pDObjPFeF/wjzu6BpRsXtnuhmq4sHd/zYYYx6usSt
	eq+rOGeQrWuGQhLH8TkFyCPzLJS/D01sQY2LfOmqXp45sx9sj752zABsAXXHcWqErmRCC8ldEsP
	5uldCo75No18D2uYquTD9w6MuZ5E5HLhcq54oVFf4gP2Bn8unqAjxxtiPp6skbeV+NKELre73Uo
	QMHNNG+k5n+fTvKVFlcI2QvWv50vGl9/ZolAkPQvF/73XzCD45mv3hLRWn++8166Vtn+NZwiLps
	XovuF71ax5MiTQ9puUw+3Kh0adP1tiweQ8sYuXB2t4iAoR6Q2Sr/euUTGXNQ2vSq0feqiRtu01C
	rkNTQ3cU+JtPXvjp0k
X-Received: by 2002:a05:6820:1606:b0:69b:b52c:c9b7 with SMTP id 006d021491bc7-69c9c01d0a7mr13771763eaf.41.1779274913206;
        Wed, 20 May 2026 04:01:53 -0700 (PDT)
X-Received: by 2002:a05:6820:1606:b0:69b:b52c:c9b7 with SMTP id 006d021491bc7-69c9c01d0a7mr13771646eaf.41.1779274912186;
        Wed, 20 May 2026 04:01:52 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d48:e1ec:d837:6344])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4eb6320sm840310266b.59.2026.05.20.04.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 04:01:51 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 20 May 2026 13:01:42 +0200
Subject: [PATCH 1/3] power: sequencing: pcie-m2: Add QCA2066 (QCNFA765) BT
 serdev ID
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260520-monza-wireless-v1-1-9f6942310653@oss.qualcomm.com>
References: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
In-Reply-To: <20260520-monza-wireless-v1-0-9f6942310653@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 3pcLG-EpmiaFcVTjmGeo_CgzDU1E8uPv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDEwNSBTYWx0ZWRfX8CLuFWRqG3r+
 XGPCGeQuJt1O/u1fUtv8bBlau1GEcNPQa5ZVDPAYi23awD2OTqINoyGkTZ0N/3V5ovwATiz7dkE
 y/V8oB63XzrmTmMTZxZQUNnAzsz+zyWF96vddugFgqIQ1TE7rLwfysdgWP4TZ9DiQUPnSoaoDFI
 lP5+F80Sg5zcLnpkQWQOHR4ZsYdUL7b/jJKI6TizmqG5A+GSJrJBg2OE4URXAzKmTAeGteN3l/9
 SNRmxmTtxP1IBHB0Y63dqaPXMppU0rSfDRNIeitaI85cGhnVg7KGE3dm0D/6ydHSdgWU/F5oxZd
 5MFuTSXLfKr2xSuHGx66ZSjJARUE2g1ziWQo+iUKvAOnD1hWx/IrpMHWWM8bRPwRJVKLaSg9N25
 FBpGnK2HStE049DLmk5/bxkj1uukkVNE2AlnClsLsccn5K/q50Foz+8j2XdnRcz4x035yPTb9MK
 4u2+IcV03oWa2dO+ihg==
X-Authority-Analysis: v=2.4 cv=RZigzVtv c=1 sm=1 tr=0 ts=6a0d94a1 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=nYxCwpw-O1B6azs0dq8A:9 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-GUID: 3pcLG-EpmiaFcVTjmGeo_CgzDU1E8uPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605200105

Add PCI device ID 17cb:1103 (Qualcomm QCA2066/QCNFA765) to the M.2
serdev ID table, mapping it to the qcom,qca2066-bt compatible string.

This allows the pwrseq-pcie-m2 driver to automatically create the
Bluetooth serdev device when a QCA2066-based M.2 card is enumerated.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index efeb25ba9c79e20fc8bc8354def8ae423d0f2f2e..f90df88c663985c7702c19911f0c147e3b68984b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -188,6 +188,8 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 static const struct pci_device_id pwrseq_m2_pci_ids[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1107),
 	  .driver_data = (kernel_ulong_t)"qcom,wcn7850-bt" },
+	{ PCI_DEVICE(PCI_VENDOR_ID_QCOM, 0x1103),
+	  .driver_data = (kernel_ulong_t)"qcom,qca2066-bt" },
 	{ } /* Sentinel */
 };
 

-- 
2.34.1

