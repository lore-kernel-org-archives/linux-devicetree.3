Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083F4481A8B
	for <devicetree@vger.kernel.org>; Mon,  5 Oct 2026 12:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202916; cv=none; b=nk1nibwePQ86wBDAAYMN9aOoXSO83fqo2Vw0Aib1dBcHptG7GEavdL4TFlCWaq1O7SJknaLuHpYjLL3rrcZ9mM3Ypc5WjACI8JLguztMzzNgp8Mx3Ce+BBP5jz9ikoOUnMrwXGY1m5cV2ov4hBEgnZ2Vg3TdK7vdklfMU2oRa+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202916; c=relaxed/simple;
	bh=UbfvsxV1N2Q2BwLuWb1XgYTj+UMWr2glJ7cM9WRcoZw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYtbRQmKqogh6Viaa9t1g9XABQcOtcEbkOkXpJ01ymees3R5W40lEUdocyJj8sfeX4grmWrchhLZJkP726lu0HwHZcuyWx2o3SHKL1UOH85gLQovbi6M2OK9dFK2KKoEv8DZGGkkM4OE/HLAtYxZQMHXEP/2udXkyGRml7PN0D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X1s9ueCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CssmSgYv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X1s9ueCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CssmSgYv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFIP51068045
	for <devicetree@vger.kernel.org>; Mon, 5 Oct 2026 12:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	khcQaR9KeJm7qpoXnT6a9/DyCnO60USLg+886y5MCh4=; b=X1s9ueCyZhaUEX0g
	fb6dt+yMvYvSoqcIc7Xvs2Wpp3UL1HuYyMkjjRcHrBeRD4Ztfmpja8tEiY/x8iw/
	8XS2lTFV42K8w7uRO9BwdX4xV6m3wIszxruVAYmT+qnCibpwnecJoP4sFuAFpKk3
	NYBCdcTnkeX3kBnwvRcwyYR/p/o1w5p/CtVAuhzjnBKwh45txawBkaq0quX5F1+q
	kQStTo8KOcImqG25oBSiOMZWKJFMWBZ8age1yUSRXyNWBtMXIVzvru0LewHlSexy
	iMNdWro8eQtz59IZNqW6ounfJ/pYI1O/+ji79ULOm9vmr00NdqGPJ6daMFx0IG+i
	8EJM+w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08nnra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 12:21:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e46b4b700so299638985a.1
        for <devicetree@vger.kernel.org>; Mon, 05 Oct 2026 05:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202911; x=1791807711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=khcQaR9KeJm7qpoXnT6a9/DyCnO60USLg+886y5MCh4=;
        b=CssmSgYvE1ipHiB3e/we2iTPgfzK5RJ4eotH9gGCSqx0odFX1eEeH4Koa43B0EWEDp
         HearNNQrXQe+tbkkQqsnN7cjzYHezx4Ci9cHQvCU3KZE74rPWW9AcmcZ4jUVkkc4SNJC
         FaUO7eUn/hjDOMOWo+SDminRtu88n/XX9rcPBgOQ00s2ZiVfPfzWANEdvd/oWytlC16u
         3kv7d+TGQ108fQnwxQtvsjWNheajMTom1JOJGQ8iTU4ZZIxn1TAE5xUR3WNTWqd5drh3
         403CXRhOqh2PfGvZ7BxYTqJvK0+wHFaV7kWfIyhUeSnt4UXdEEXofHNjIhNfR+BBTRk6
         gsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202911; x=1791807711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=khcQaR9KeJm7qpoXnT6a9/DyCnO60USLg+886y5MCh4=;
        b=oY2SnvPtKMH9ZWIg18SS6QBB0azHk/iiTVXFst9b+JxCdOe5p8Hb+ECCrfRjkN3XCE
         ZufFW9hElLb400ejlito+JlXuoAE5nybIgiEIgoUzYV89EQrk2szkHlJq48qhDIHcVjS
         /O7ZawQ/gxRqeB+TnRWZYETLQLyuGrAHB+qVwHoyrd5Cp/VoKoJsnJt6onkwB5kmzMoh
         m0oObrxsS+V0362/zTNBnMEcl3fi62DJolt17+/v8r3yM+JhXslW0OwTEDNqZPpe3HWJ
         6p/dQfBO+L6tsqGo+NWTUDrjVGAiSI1SXmOWpHRncJSxL1xuk6lRZrDdO7M+1J9rU65y
         qHQg==
X-Forwarded-Encrypted: i=1; AKwUvByS+rSr+YDEbU//rJQAfgvowhatGaiX9lLds887NNYu1T9INLAoTKwbXWKPZ6EX8aAWav7VXaKT9P2P@vger.kernel.org
X-Gm-Message-State: AFuF++nk4Dh38XeXcppcJbN2bU77qd9VZpBXkIK5kLAo0UW3JT98R4Jv
	j/qNu8hrU+wJ7YzdPpaxzfztu5oj0aqL5ZF3mLr47IcHcRsm3sijaqNUnta6esnw53uBHwuafam
	c0mdlqC1rOIRuTlgtXTAN7uYL7NBlHQD2efn4tJ99IY4pG4ApR+JlpoHOT+q8kIJd
X-Gm-Gg: AYBFou142FdmX8XDrnTBqRDIovYbangoI6ob2imcDmukc3UiPbwwJKC36uWex7OJeyk
	AulBp3fCpdlZIJTzV04lChhwytSQsgANjQaVbzGQVEYMFB8SLNA+j5ab/heaR7d6ge3I8LaAN7R
	OyXy9DxQph3t1kFva5w3/du13T4OAUOiqK5tGHmfAR8yWAPaqajouHwN0K/1UElgmV1tG/tUN++
	cjA396IW6wcCogRoenPMYVX/2ITQpXrS3F7ArTbm+fYulXhy8iA3ZVrnKsoyjQj/P/6fUGkqnz6
	ggBnmEwBdtlBws6gc7IKqqthk0neMa7TuAIx0+D9gB5nL2xx9eLhxw40Xal5Sgrpgo6Y8s607cD
	BHmw0/IqonGDgpwYD2RQR5vdY13IpY08X+bqH+S5WCgH5e76U0mqfHf2k9v7fBLJhJSer2gEHj3
	oAUrb/f5VlY/2e2z8k1DfOses6HIuB1ZwHH8IN9SE3lNjBGSLi6swX+vWG7LfSAp79GAk9oA==
X-Received: by 2002:a05:620a:199d:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e510787ccmr1202223285a.49.1791202907855;
        Mon, 05 Oct 2026 05:21:47 -0700 (PDT)
X-Received: by 2002:a05:620a:199d:b0:93b:beb3:5898 with SMTP id af79cd13be357-93e510787ccmr1202218185a.49.1791202907310;
        Mon, 05 Oct 2026 05:21:47 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:46 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:31 +0200
Subject: [PATCH v7 1/8] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-1-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
In-Reply-To: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: m3c4Z3M5LtQz2BR5_5JtsIyJ8SsUUEqJ
X-Proofpoint-GUID: m3c4Z3M5LtQz2BR5_5JtsIyJ8SsUUEqJ
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac39660 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX5xpsWHfTcik8
 OwzxjXypAsTQC66vax3Membs5nadcWNEfBVXb9kPwvquq+ymOt+gXzZFssAN6czhpJT0WuGz/ID
 dawjVmU660n+D3+06iwGKdt9sD/ZGdc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX7vTTwM4las7O
 qpsrlluIk89DULPxtnvlrK11P1YbNClSlAH4s7IonPH2FRCw8hKBFi1I4G/g2N8z0Rgo1iy7/hl
 UIQmfzPqPWT06BoeX43EHuc7X+xTTSPsRDL7Wuq6qIdfNY7cOFIdh1uFuaTnUSbUQ93SrW5Enj+
 pfQRM/djL/z8ZBAul5ZvqTrASoDmF9jahqno0zP8HjRoLqk4bLRi2+/YBXtn/LsneFmsueBGhBx
 Qp2DaugY9yloRlhOyX/QgVE+9w4cgp0kolTiw9oKFdYOCM5d+TFxH8TupL4hU++sXdpZBG89epV
 i+Oc0zKv1XWgSIR39Imt/0Z8zxDz82WXSR7oi0Y+Rh9rId7WK2VyLpqMQdT7JT/7rdiBRKDdOGs
 k3ghrLaYw80BTYODZ8uFbineS9QDdu/K4s2/Z0xcOL+ErZZK+UkWClUOtzuh+OPUYnGi7FcZ2e8
 GucrZlnEO+ZUotnav6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 7089e9b639b2aad2d5ad2d43b07f495833757805..e249fc6e44479142e25af4e37bc4e1bdba13cd98 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -25,6 +25,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2454,6 +2455,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		/*
+		 * OF graph link is only present for BT devices attached through
+		 * the M.2 Key E connector.
+		 */
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								   "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1

