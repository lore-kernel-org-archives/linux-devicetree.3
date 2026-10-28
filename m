Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201196;
	b=v+AHJGZBrGktDvJuFbWE46c5oZTHCNSzKtwGsqbau+teaet86QJQuOjKifcb+/LyfMy5
	 lbF4gzdJxSs1ZlsA5HLaBgTQ1D3j5590OQcx4UzDU+wiDmJ+E9N1J87rYB2d2vjdo7Y3Q
	 KpHBJB5qCdPvofSv0rmnofbiv/nRdOrvNXy8V25UdMyZ4a6Zk/q9CldTVlFtjcxrJO0IJ
	 T0OfHEQ0UlvtNAdGq5QC2JuP8SoNmR17dpJCn/YYpMmFFmwX3A7Wx1TU/hq65JQW4GQNg
	 wPmhU169yY2WYJgRjmjpvz9WCaXJLdXRbvDP/eN56YfwGUq06zIFF4pqLVfvvU4Q3iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
	b=b/FCkBcrt6E1HAQzCFre79kHpzyZ7LbHTfLoZ/R1ytb8YI7ThTbA2AIndNTBcUjiFRwC
	 oeF3XXFMdIG5T5Fyx/cDyTX/OPcj/RggxbAr5mE8GnKq1sK4pWTV+OW2Jcs8jGph6E/gx
	 E3Hqn8QXF0iMi6SfyvFgaHopIFENvF1xbdg9lJa3pvYlPGt3ybI8LxD3bYyHHAPfF0zCJ
	 9Dz5TP4aqIbRj1KzrF6vmS5BBet2svZ97zXttbGSUhvttvnxnwijXHRK+2oisiuZ2tin5
	 JAi7cPmA4W1Qvfk1fGJHML/2gbZekDLHrjNe5gnW0tjoqPsGXhEthCGYlbusTBs5g/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LoDc/5XT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tjy2dR6D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FC7606A31A
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:26:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FC7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LoDc/5XT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Tjy2dR6D
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9uq02542927
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:26:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=; b=LoDc/5XTmMBooxcy
	IfTPwVAISSl8X+sMQCuLqyCw1eBNgxRbZMIEMdCtT0aL3lGJ7T+v4GJ0gRUNfHXE
	2Lm6sxG1cr6I7oIJVWoM9AtRe2X8qWExgfPAGfUKVrVC5j19upkd2qGgct+8Uz54
	tpdjwd2iFkQzUeSREFrQM8dmbiTJfp5EbZvkd2pRQS6rVWwFeJ5nWuGgfhstkHkN
	RIA7Yz31fwRanknfdJZKPUrO2tUt7JyE709L0vuQqCBaI0QjDFslzruXhuO6gQOf
	H9prJ/sg9N4kHm+lnmWZzuenAiOI4rLs5w8Gc51dsjMmz1ht2tys5GRdN5wniOvv
	0091xg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehr2qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 15:26:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so189764085a.0
        for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 08:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201194; x=1793805994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=Tjy2dR6D1bgXpRCalxixCL+im02Z3YDQh11qdbhFKVf6VYIfX2mXaxye2R1DKGJujW
         l9os/W0OGBbzRgVhEQ97eLzC6/ywwEf4p+ENdm1tfs+7RNDuZoF/qnaSHlnoW65M+SSD
         nigFoj0WOHRmFnyxTiBpokM0MFdfFBLXClCrqZwEBEHDjNT5HIcqg5Bi9F7MmfecXEPy
         BSdf3qKjNedFDwn86u4so8htgkT30U1PfHdNMeiuylHTV6nh6RIO465phG3d9T1y/ZCJ
         sD0RqblGf1hbLVvPHV/ELII56TNmTAT7TTUcyJVr8RTX/AG/7MeS/QOJXvodYeFVWp0e
         c3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201194; x=1793805994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cqDVyaKXq+Dr1Nnq0iNKy30FTmkHBecOrOvcWsTRTNY=;
        b=cRew/kYyzKFXcDL3/SrBmh393cKrBwKfSsL4o1kAGDEYkfuyHZLg8FL60xUSVkAOqu
         /rdNVoS+Y9l9RRVFr5w0reCU/5suMXPP/HsxeRSMaVEppPW5WDcSU23py84BxFTboFD7
         F7zvVSs38t8vtHYr8BZOe5Tng6wK0mPkwi/L8VKDoiJ4Kdqr4u0K8x0ji+LmDgNtixTY
         7bBfSZbCiPq+zQhW6ScjQd5PI5qxOyhFbm6n8OK6UVwE4Ngr5+6J3qxnfsiD+5u03VOh
         IUp93O7kP1TD8dKVd+l7ifelydN+Sz2JoB8ZthjqZ+4nNBVzv3eH7TrSq3e75FUdZauU
         y4oQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+AjdM9dH53P/njpa3vZUUqpAcJzwASJlT18NfFzmbHJ0ZLqSra8lYF6EcmB9e17Nte9+Jm3R+r8cy@vger.kernel.org
X-Gm-Message-State: AFq9FYInBMbyfpjmhgnAbiw8TZAiqf3fIAUijDe+9Akpz4/wm0Yyrflh
	6bm2gTGYZAFjeoTh3ErBBPfnAN7rhffOVPHTuvkG9t0XqSX8M4F8kHhMMC6/FUXurtnGUfOSBBQ
	Cr8g6HGHtCyJ7vxlm9DVyN+Ym4vwW+U/rYxVxzzPFaoN4ZLxyjKPYeCYWa8IuSTm/
X-Gm-Gg: AYBFou17cGov1n1f3PoTyFw2vM6XwMmbAQEzc2F1sSdwyDLIn/M40fPM3ckN98OftJz
	QQr6s++LgiBH/r4rFyoKlTWUp+nRat8XyJHLJp2EOQhsduKN5b9k8jc2sCSYEmZaP0q18M9Rskb
	hJJWFrRc2L32gXmxW997iPGHc5zJxuTKBglIndpYXSBWxIAhDtsGdYTNpswr1xyhkbtmpOfvacq
	IluRPkyXDSs/47A3JA3VsnEDOblJEa8bguaSXQpv6nznC3wioJPulQ0GVg+TVko16d55QYUGvaZ
	KI+Q5iPUO9P8yNhIJEl0eKmIX2KqfnFlGMx63zriEZjbkAXFanRCn2xndMzGxVAzNMI5LumqnMS
	KuiQ1Cc3ir2SVzVNKReivoNXlLLD+v/EEz3d4J6PJ4H9HrEk8AOWVh2Of3AGHheG/vw57J2v5J0
	zH/XOwODVc4lNqH+GOr4+rsV9C7n6r2Tu1dqDBcntpILpM3Abi4ztCoIFJS5H1
X-Received: by 2002:a05:690e:1248:b0:676:9262:e743 with SMTP id 956f58d0204a3-67a7bd7dfd0mr1878878d50.107.1793200872163;
        Wed, 28 Oct 2026 08:21:12 -0700 (PDT)
X-Received: by 2002:a05:690e:1248:b0:676:9262:e743 with SMTP id 956f58d0204a3-67a7bd7dfd0mr1878836d50.107.1793200871586;
        Wed, 28 Oct 2026 08:21:11 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:10 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:38 -0700
Subject: [PATCH v23 04/15] media: qcom: camss: Add addr_update hooks and
 guard CSID reg_update
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
Message-Id: <20261028-kaanapali-camss-v23-4-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: EBCvoBgGjMSzarZt_GhCgbx9OzR1ZafF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+xcZk8FFhT+t
 j4v0HQaQWJbBIpzxJRL8RnMvmbxEsTi72i5vO9aHJ2TDeivwCfUBlASpSb9VBsvsnwkyKabqe/C
 ne5sNVJDYa4RnS4HbCetGMWRr1Cre2jOso2LbNP97dzorGL7DEJ3qKmykqa3WND08OoXoItNfpN
 dJTal25Ma2Mubdxa/HHPyOPA3ezO9UlSFJnjZQlJC0w/3m8oYkopj8H9BD5ReM4l7brN6DITna2
 MJr+4+B38dkxERZAUQp6/XdWaM8Q8JgM2u/a3Smgyxzhf5iTTXZuKk9hMej5Oari2SkPHZOjO+3
 UNDuX2akYDkA5LnJoQ6irvZU9DgKTWYhkwrh3x23ymFUDBcqj0sZqOulCZuqHmy8kAOQ9inxFa9
 RT690uoiXRbLJgcJKw3JHJH/Jxb0GvKqTHHpOHQxLU5DlcSJxSkdcHbIvXBsNlX1zhg2wg1ax6j
 FkQ+lPSmSXr+lt8jGLA==
X-Proofpoint-GUID: EBCvoBgGjMSzarZt_GhCgbx9OzR1ZafF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXxee09O4Rs/cn
 5ivfFWeQGjH9YsSnPEkfo/f5Hhtf1kG5f2YNnp/WpFzZGT9b3ugnVQ1gKEb4MpDF4MWmQ/48rYQ
 HdM5BtjNViGOQ8CAujy98mEoU1/pTC4=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae2142b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

From CSID 680 on, CAMIF was moved into the CSID and the CSID became
responsible for issuing RUP commands. Starting with CSID 980, RUP and
AUP are issued separately, and each command must have its corresponding
SET bit asserted in RUP_AUP_CMD; otherwise, the hardware ignores it.

CSID 980 and newer require a specific stream-on sequence. After the RX
is configured and before the RDI path is enabled, the CSID must first
issue an AUP and then a RUP. A RUP issued before that point would leave
the VFE without a BUF_DONE event. Therefore, once addr_update is set,
the VFE must skip the initial RUP during stream-on.

Add addr_update hooks and camss_addr_update, and make camss_reg_update
handle a missing callback safely. The VFE keeps issuing its initial RUP
during stream-on and behavior is unchanged if nullify addr_update. The
skip takes effect once a generation that sets addr_update is enabled.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.h |  8 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c  |  9 ++++++++-
 drivers/media/platform/qcom/camss/camss-vfe.h  |  3 +++
 drivers/media/platform/qcom/camss/camss.c      | 15 ++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h      |  2 ++
 5 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 5296b10f6bac..2f7e593defed 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -137,6 +137,14 @@ struct csid_hw_ops {
 	 * @is_clear: Indicate if it is clearing reg update or setting reg update
 	 */
 	void (*reg_update)(struct csid_device *csid, int port_id, bool is_clear);
+
+	/*
+	 * addr_update - latch buffer address update through AUP
+	 * @csid: CSID device
+	 * @port_id: Port id
+	 * @is_clear: Indicate if it is clearing addr update or setting addr update
+	 */
+	void (*addr_update)(struct csid_device *csid, int port_id, bool is_clear);
 };
 
 struct csid_subdev_resources {
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765..4f8867daea4c 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -487,6 +487,8 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[index]->addr[0],
 				   line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		output->gen2.active_num--;
@@ -525,6 +527,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 
 	spin_lock_irqsave(&vfe->output_lock, flags);
 
+	if (ops->addr_update_clear)
+		ops->addr_update_clear(vfe, line->id);
 	ops->reg_update_clear(vfe, line->id);
 
 	if (output->state > VFE_OUTPUT_RESERVED) {
@@ -552,7 +556,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
 		output->gen2.active_num++;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   output->buf[i]->addr[0], line);
-		ops->reg_update(vfe, line->id);
+		if (!ops->addr_update)
+			ops->reg_update(vfe, line->id);
 	}
 
 	spin_unlock_irqrestore(&vfe->output_lock, flags);
@@ -588,6 +593,8 @@ int vfe_queue_buffer_v2(struct camss_video *vid,
 		output->buf[output->gen2.active_num++] = buf;
 		ops->vfe_wm_update(vfe, output->wm_idx[0],
 				   buf->addr[0], line);
+		if (ops->addr_update)
+			ops->addr_update(vfe, line->id);
 		ops->reg_update(vfe, line->id);
 	} else {
 		vfe_buf_add_pending(output, buf);
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index ae9dad353a37..8312e4c91e98 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -99,6 +99,9 @@ struct vfe_line {
 struct vfe_device;
 
 struct vfe_hw_ops {
+	void (*addr_update)(struct vfe_device *vfe, enum vfe_line_id line_id);
+	void (*addr_update_clear)(struct vfe_device *vfe,
+				  enum vfe_line_id line_id);
 	void (*enable_irq)(struct vfe_device *vfe);
 	void (*global_reset)(struct vfe_device *vfe);
 	u32 (*hw_version)(struct vfe_device *vfe);
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..be58a39f4a8b 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5049,7 +5049,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
 	if (hw_id < camss->res->csid_num) {
 		csid = &camss->csid[hw_id];
 
-		csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+		if (csid->res->hw_ops->reg_update)
+			csid->res->hw_ops->reg_update(csid, port_id, is_clear);
+	}
+}
+
+void camss_addr_update(struct camss *camss, int hw_id, int port_id, bool is_clear)
+{
+	struct csid_device *csid;
+
+	if (hw_id < camss->res->csid_num) {
+		csid = &camss->csid[hw_id];
+
+		if (csid->res->hw_ops->addr_update)
+			csid->res->hw_ops->addr_update(csid, port_id, is_clear);
 	}
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0..431afeb381aa 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -182,5 +182,7 @@ void camss_delete(struct camss *camss);
 void camss_buf_done(struct camss *camss, int hw_id, int port_id);
 void camss_reg_update(struct camss *camss, int hw_id,
 		      int port_id, bool is_clear);
+void camss_addr_update(struct camss *camss, int hw_id,
+		       int port_id, bool is_clear);
 
 #endif /* QC_MSM_CAMSS_H */

-- 
2.34.1

