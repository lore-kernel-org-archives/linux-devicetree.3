Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429544;
	b=Wx3i4AGPMJmh7UEI1AxBMVuaGVW+xTV2U1fdJX00+f7AQRMQtFslbz6/21JOQ2egBOSo
	 qBJwCsR7KEmCD15dvaGijqCUaYnHIDhKHMAEsZXs7ZsV/5spj6cgVyz/mtR+K8pOqYwS/
	 Ez6OvKwmCM1GAMgoZZ8IE4FSArsPCwds38WKIvPUfS8HjNysZEizPS/kzNQog4oykPwjg
	 7nPaj981WWbpKFGAZH59jBViEN909aibbpga5r7IgQEhQCPsrcqrcTjn4Bj69xyeX8oC6
	 NWzEOyAqByhAZJIjLEy2MN/CDWPcmpRYP6JJTfTxEbguVDfhUss/zOOi3x++Rp3n8vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429544;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zuHpqQkWP8DCxuWOtgyzddlRMbuSJfJbAsNyifLrpAY=;
	b=Zg3Fb53Tj+WLFiV7Ui/1Cyige2AMU0mWQDUWDzZQ2lUMZxxAlMOPJvHc9qlhshbjhtwn
	 q2Lafa3ROJZx5TXtg+B/5Tu0FvOLoZtBjI4KuF42/GqefiOnTP2HvcSJFAXCfS8GRpkxL
	 GB9UwM97WY4LHLYGa2R+o5i+lyj3aI2UcdyKPzPOZvwnficUQGDUps87qocnxE9gKi0jw
	 83sT2deAZZiFSV07cgLuk2VvOpopxpyEr9+02la4KM66Yk5Ir+r7F53Uni9/2m8YXwsU+
	 Vm5XE659k6pA34jJGQIJtpl8h1Cu2p7RpC2zliKbpWrgVxRezGRuXkXDaCRamylKPxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pzMhzkT3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIpxouXS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCA2606A69A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCCA2606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pzMhzkT3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BIpxouXS
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G4v31899656
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zuHpqQkWP8DCxuWOtgyzddlRMbuSJfJbAsNyifLrpAY=; b=pzMhzkT3QRT3OAzR
	CB/AD6PqcTEBNKUx0VU4nn0GAIJvP8xn35LrjLiZrtDog62ek/bciB47YEzx6fLY
	oK6yaUnqAq5O7nEzREivPypxTMeHcHCFRb8yLKQP0N04+x783La4SvNZvA1bv8aD
	cr8GCIvFc/TTvgsb+y6pHfroWg1etk3gRaXGwxp0lhNEHXJPW/c60R2hOtFJAYaf
	94it+0Vb73SV5pf8en9IkpZ/atBav2rhtVwOoy+iNV0D6ocFeVqMFNLDQ0rUWdWP
	7AvgLTY6Rhni7l8EQlI32F+7x2p7pPS1rLtYjDEnm26VC6IwkhWWfIScdkxCmjif
	DJANwg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k0xjn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 10:25:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so575993785a.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 02:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429541; x=1796034341; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zuHpqQkWP8DCxuWOtgyzddlRMbuSJfJbAsNyifLrpAY=;
        b=BIpxouXSSc/54BaODqdngfTIsb32KsP120FAsUwlUFAdMc76dbcxIPthYftn7cjNbC
         JDEJSPNim24fLSfbrVLWcIC2GVNX9tQsVB0AU61T95k9130Bk2LyLZayosCL9kRTNU6J
         2UobXj6T75Up2FdpXpGWQChLDdDjCJIUYPf8D+pCYO3P5h5Ks5Ai+se74s2/iUYgWe2p
         2gRB0z5ZwdUX9V3p3N8v86r8CF+PJjsTSviZn06sYU39O7z/LfzP1WDt3OGEExfSJoxQ
         PS//zqZhA6GRuykuA2VhomBwTZXt3C1pcHfCF+sxq2X4TBDlU6umwQ7i68SA8hlUuwK6
         Tc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429541; x=1796034341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zuHpqQkWP8DCxuWOtgyzddlRMbuSJfJbAsNyifLrpAY=;
        b=b4RQRtPM6dGmNUNTJAMXQ3nSZLE+rKwg+/+yJU/wYgI1N0mr0gPkCQLiZe+YVt4sNr
         bQJJ9lqChYD56ZJ5aK5wxqIhzyty6jDb7buk5JLMRA+VnVnMvos4jrfv8LImo8kbgz8E
         7RS4vAJtnUkFfygzTyArrA0cNTuSrTDzL9aMk25cn5vSGPnAqYlhaoUzcX+X/TTDKHFN
         CcIrXGO/tnYm9rccCa3tlPQK52/JC04zPE3xtBH7TL8B3AJS6admYNoefLhE66T5k1VE
         Oi/RO9WAJ/CEx2WGPzvr+tuYD09cPm2a8hacCLkNP5uK2T5i81aI194eHcA3eMTpNKN7
         wkZw==
X-Forwarded-Encrypted: i=1; AL+hErErLV8Hb7ph2/XGoB/O7Rn6G0N7GThqmyJRX8t1kvw2J1WjE2VcYOoYUd0LcUlwyLov2lkKmI8R5rRj@vger.kernel.org
X-Gm-Message-State: APuU4Z/lFTcs5RynVr1kSjID6vXX12xEcvexzSOCA3c/2Si2JOCwwHW4
	zDX5gwb8RP1y/YCdHpef4Z48sUUYgjhZDBDcGcKFslxA/FeCuEIiqB6utCnrrfUldZOllwUBIqH
	HUB46xT6iDmDGTf3uYHvP09e2oYZxNf5Bw9xEDKk8oirkk2VlbcPoNA3fZQM0rBQf
X-Gm-Gg: AZFdTZektEGiB7qzhkvskA9ndJJC1wV6FMBcVAoFwL7K5M+VCcgkqo0WuPnKsQ9Db3W
	ZFBk0BU/subcqZAPn87Y6kciZDmoQV2ohBZIBkjlD6Ir0qTBlkywxusxHXH/3Rx78r7i8NkdMMm
	lOdVB5+drJzB1wboNad+JJRzDlQhGPk327AiSzNuZWQNS2jArr3hGHPkC3YL70ClqkVx+XsKhQ5
	TjX594eHXZe6/M9N8/vgsARfH22dgytKLwwXtgdBUsGsf0bUvEGMTfFenlW+l2tcRpcBQOyVs/0
	IrATqQrMsgal8Yv6fGixUJrUvz1MSsRhbRYBMwPmBJLyKYJMHaSZUombtRVMKYTfNaCLKPCQdY/
	2A78QgKLnAsKZ6168OwWy8ObYUqX6UKy1wrmzE7PUm5PaBh2cwV3ydIjxA0nG40eCZ4KQEkRNQf
	PiZbOEv5zv3YFuCCYRWIjBLVJjeMGohEztcofTistgGrSFnhCUz4jzemvIDr7DUqAYh/MLbYUfX
	9v5ZiRAgFv3Ww/bMEx/41J2OA9j
X-Received: by 2002:a05:620a:2243:10b0:949:c64a:82c8 with SMTP id af79cd13be357-949c64a8922mr965996085a.39.1795429541240;
        Mon, 23 Nov 2026 02:25:41 -0800 (PST)
X-Received: by 2002:a05:620a:2243:10b0:949:c64a:82c8 with SMTP id af79cd13be357-949c64a8922mr965992585a.39.1795429540713;
        Mon, 23 Nov 2026 02:25:40 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:39 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:34 +0100
Subject: [PATCH v8 3/8] Bluetooth: hci_qca: Set 'bt_en_available' from
 pwrseq controllability
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-monza-wireless-v8-3-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX9ZJ1CDdBIVTv
 HAFdxDRm2igoOt+xaHKoi4xG9CAm6Du8FMzsDpyWwpzcegIkvKplnXTCSbA/aDgpbz7SkXQn56i
 ZAOJQ7GGUchPb4I5GXhmamj5qWO48lM=
X-Proofpoint-GUID: mqAcg8s982tTH06AaryjnMyAOB4a4hfv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfXy3UBiHNq4ktY
 Jhn5Xcyoh8oPqQ9BeELNMmeTkiQosej5TGTsMIlsmdquj/FhwuvfAqcoNpCwSDxOlHQRvvz4jMW
 Ttclp3oL/ymzmL2H2JU5x8hlxkW8T0tWKJ7tMRgLkxhaCD2av4jD/MyXJ5nuLk8QwA38dcwBNoI
 1+lRkOsus6MdsFkT8+KqrHFpTmaur/G3J0aZX8HLLuUNmYe//DCVKPnOAvC+CIaYYXfqS/1WBHk
 dz9Ivjc9P9hCD8VyoUUA8OvFGtPEbG3WCwR8jGw7IYF6s5MuyJZP90joollA4gf4IqF29jfU19q
 Gy8ENbHZ9AF7zO2mgS8L8bu64NKrVex+2jsExBA5S5KIKzsFB0z5sXa2CDCtwIefxpRPKxZV6Ws
 P0QnnEwfk8Gb8lSv3hlU+kuXOeY3xmU3IS3p03F+NMgyebaiKf9fQ9Fb/vzXVwXf2KW/BUnx7sy
 UAtQzuBZrDIw8fqbcNQ==
X-Proofpoint-ORIG-GUID: mqAcg8s982tTH06AaryjnMyAOB4a4hfv
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0414a5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8YyhkPy0JF_pzLATneMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

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

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 3b2792a3639cfbd9ee7a781b6e4c26c660495391..1b7b011cd6adf682677a01bd8d501a92ce896ec7 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2631,7 +2631,24 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			return PTR_ERR(qcadev->susclk);
 		}
 	}
-	
+
+	if (qcadev->bt_power && qcadev->bt_power->pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+		if (!bt_en_available) {
+			/* The host cannot gate the BT power individually.
+			 * Treat it as always-on and drop the pwrseq handle.
+			 * The descriptor itself is still released by devres,
+			 * so dropping the handle here is not a leak.
+			 */
+			err = pwrseq_enable(qcadev->bt_power->pwrseq);
+			if (err)
+				return dev_err_probe(&serdev->dev, err,
+						     "failed to power on BT device\n");
+
+			qcadev->bt_power->pwrseq = NULL;
+		}
+	}
+
 	err = hci_uart_register_device(&qcadev->serdev_hu, &qca_proto);
 	if (err) {
 		BT_ERR("serdev registration failed");

-- 
2.34.1

