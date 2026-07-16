Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1323C37F72C
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218726; cv=none; b=mGZ5yd4eDOHTVBO+z/kpRCL6lNyYIqMwQ7PxMQmJ4CYEwUF6s/4fHJf8IKIwhoox2lzTmKBLvk/6vbEw6nkQwtmNDAvf+lLor6iD7cnt1Ax7ORkp6TLlvGVRcXJMkmI0Cqmevy/0kD+PJAl08hoR6hLVnGb9vPHYhfC5QrzHmjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218726; c=relaxed/simple;
	bh=USfleaUVsPGQXLVUjbre3lqCswipT+fDSdHAw6xnKWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Js026JTkHJ/3ebIj3cQPoWoc6QI1Ye+fImY2GZONvekFeim/4WN7ci/O8q83HDP58cLDUevuwul9uPZKS5YwT7hrlVBR20bJSan+I1kS37g8msAuhnqXK5/aTU1ZZ3KR+8l+vyBFPWyzxxUVvJpMa9PYyL9HMoQLMCoTK+P5W1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eF7HNDpK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YC+lqfyR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eF7HNDpK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YC+lqfyR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKMhA2857816
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CUSdiqJFqg8hwn97+boIemtGgCjGndnT1ZgagmOIPvM=; b=eF7HNDpKPmRuaZx8
	4/5SO3m/WN8rIxWyJyqRFTfL9lRHETXR3kVhlb8C5ztZX8WFv2SBm/TlzxayYyYZ
	TlfMWnXUpU3HZrgPVsdvRLFQUwkU1xFcdnGbXvP/SfM8ZVAolffTKbtAdcpEvNdQ
	vugk7lwawDpVEjYSSZlZhk4vb0OwXs91STcWn/L1NlrFLDUJI3clQdfeQB8rdj1q
	iSQcFURn8OKp8qPFzVBS9JLjcQiefrQttOxtBpoObeSrOZcjYqEuelyiFNZq+AWH
	QY5OmoHodAV6VF3CnnsqjILym/2UpvhfnReqpJjgSPyUnAxp7+4Hi79vSAiS9XSL
	NHhXUQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex25y5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 16:18:36 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso77344001cf.0
        for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 09:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218715; x=1784823515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CUSdiqJFqg8hwn97+boIemtGgCjGndnT1ZgagmOIPvM=;
        b=YC+lqfyRPr+1/ocKvubWH+dlHQnxyk8QyXOFmYpNZQsYLlrMjFl4GEqEYHOaw8HLRj
         Is6v3g1u25bRb2iin5Iy10VpA53F68i2ydF0GA8PNBJDujE6o0YkyKgavciTj2bCH5Vm
         GYARibBAYW5EIFx7GwuGQ2tWOeEY1CGhwqcxvRwAfWarGtkOq9hnmt4QBQSM3ZUgVIt6
         jKF7YT/D8GPyTZEDLjcszL/bM497C46ypNu+V1wE5M4jD2Vs0JBTSI8DJC9zBs+28Fqr
         qtPZ8m4Xe3NhesWFANhyQtyoKwY4gKtmkD7CCf36KVhFudWK6WeUCw+vvO2k1kj33jK1
         7Dlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218715; x=1784823515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CUSdiqJFqg8hwn97+boIemtGgCjGndnT1ZgagmOIPvM=;
        b=BHISNAqZjzr+UieMmkbowGaW7A4hl3FcANon4v0eWdEBANDTUxkaJKwqZSuxoy89XC
         wxKh/c0tcqkuPE99DTjGxLTKfxXOTAkAfOpR1Wj1RPNR/iks3ro9QmKN7RFk+yIQLNmp
         hW2BiPWxulHcK+NcgJpGMzd10BfQk7IKy0SVv5Re8xNfbH9OP0FJnlKK34f9PDMDxcPh
         Q7sYru/pofb4WzPoednmUXB09e92SOSH2Q0QtfNxZXD/6xRs30KzmvhhJbyX4aW45Kl6
         BPuQxe0orh/h+xYqb6Z60TtUEtz+iEayVQNGeYL7KiIVujfzfCimO5eWRfxpiR7XNCm1
         dwWg==
X-Forwarded-Encrypted: i=1; AHgh+RqYjh6KE+wA+ksjftX2HoxN2OBEcq8+vJ4ByEZWZKOwCEVfVMZk0F0OdfNjZYWXSEonM2DSh1fNxkHa@vger.kernel.org
X-Gm-Message-State: AOJu0YyFQ8ZEJc/cdJ7H1hyydOTaYQ0Vj/lojN80oq5YQ9fkJ7Q/dadN
	pgd84jHnCPs/iYsd+hYMZJf5YGO5aBfsvTfaO+dEyaNyQ9/cx75Ipmwu1q0vfi17Wgud+x1QJzn
	wsN9pxW9Xd7Y+4zl79F60O5NKu8nuRnUhaxt0UwVyVlJrRwwzJ0+10AWUBCzyk9OI
X-Gm-Gg: AfdE7clqgC3F0yh4L95pgqSgaYTs0cAt6wjKk2DuL+RCoYYS8NU7uN9BgFP2f3TxWLC
	CRl9txMgpEmTGUOv9tn+S55Dp1PJvCeAj77JKLpEjEClba7E7xyqC4GjZp8Vy9KyKjl0pej69D3
	K/vVdXwSCgD+UNCX26hKSB8eZFj2izif3pJJvlxhEUFJMG1EAVDpnztMdRx9i6RNRkGIVV9ymuv
	7TftSQ5QGPA9eQQQcegwUtYraQUgK3663dH0qnqQYxwMeOjfx7MvbRxOr0L3QhOQqHVqRWN42rR
	k+HpCiX5OyLLpxoyWJf2JFkohloba/L42ALmOghO65v/yhuKVjOKrQsPY/rfSCvelQrBYgYvryi
	EjaTpl1PkPmv4Py8egpd/cHWh71ukJMYx5Ewcrfsh/cV2dSHEIooyI/UxwTvCKAMo7PHJpnRquv
	x88HvANXECBiOwgSTRg9nWPSRc4dp5AE9l6iLjGsTiljCZBwkYABg=
X-Received: by 2002:a05:622a:190c:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-51e4237cd7bmr114630651cf.30.1784218714987;
        Thu, 16 Jul 2026 09:18:34 -0700 (PDT)
X-Received: by 2002:a05:622a:190c:b0:51b:fde4:cd4f with SMTP id d75a77b69052e-51e4237cd7bmr114630181cf.30.1784218714223;
        Thu, 16 Jul 2026 09:18:34 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:23 +0200
Subject: [PATCH v4 06/11] Bluetooth: hci_qca: Set 'bt_en_available' based
 on pwrseq power controllability
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-6-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
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
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a59045c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kStU6zbECEpzgAoP-VAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 88IHs69lIwYoO5bo1v_jjXVS1zDPgna5
X-Proofpoint-GUID: 88IHs69lIwYoO5bo1v_jjXVS1zDPgna5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXx4qMm3XT9aaR
 kwdmvtFPH9hMe6KaEx9YBfly8sI6zPPPfWQtu4LD8z2ZgTysDJkFcs+faBuHSF4IA5b0B82NQdT
 khHndifJdV99E1bWhFhK71eofLU7vTo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX8naykVME7ca8
 UhnhProNJIBji2a58ZkB1qProyaJFtfN74rhhtigWfKW2N5r/OEmEMOkK8c4yFUZdoT1dUbHec1
 2YQI8TIwvjFhDZ5eY3okzQaJbukce5kFwRdyhcbJtlRqv9AUyJTg8hH3oSJl4zKX2N3O5zNasX2
 tBk7cj0XsMrY3eWuRj4HmxGmpA4VrNIKDvDlosSbLSULo0Asd/j4+4NTd5013VQQHXy/QgNXpUf
 PfNEmfgNAGfqD7pCRqXZkD4RIckcrwRyL7HpYI1n9ArjV3f8maOjN/rQUMxl/GLog9IqoqV4HpP
 gVojzXvihMNAgPdJDYNWBm26LBHX6YbQMVgo7ISW5IBJ2iiFmZr1flrvQAL6HjPNEiCsG0o0M9Y
 yahsTSJJ6ounmoZVPc/OpfV9AhBMJn9eSmT19/IeFmjh3cXlgyFrENrAWIOUG0OJNFlKxi5uci7
 +5pt3kiQgWt6S9SKxAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

A Bluetooth device only needs the non-persistent setup if the host can
gate its power, so that it is actually reset on the next power-on. When the
power is controlled by a power sequencer, whether the host can gate it
depends on the hardware wiring, e.g. the presence of the BT_EN or
W_DISABLE2# line.

Query the generic pwrseq_is_controllable() helper whenever the BT power
comes from a sequencer, regardless of which provider it is (M2, WCN, ...).
If the power is not controllable, clear 'bt_en_available' so that
HCI_QUIRK_NON_PERSISTENT_SETUP is not set.

This is based on Manivannan's original patch that keyed the decision off
the W_DISABLE2# device tree property, it now uses the generic pwrseq helper
and handles the always-on case.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 17f436484e1e74d1dd690ada22134315abb767c4..41e8c302abc2a820022d1783f1fad76b358ae67c 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2548,7 +2548,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
+	if (qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 */
+			pwrseq_power_on(qcadev->bt_power->pwrseq);
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1

