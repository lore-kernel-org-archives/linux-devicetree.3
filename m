Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548043;
	b=rTC8s4R1bbFvom5PzGfG9Y7SZl5Xk8n8ITO0NZAYd7CZJVCEaC4JBxP7QDNmWF+jbU/w
	 TibhQpx6u24OUgZGobNFGhNkb5HBEPuMd2B9nbICExTFQMQWwGe9wOq27koLUIFI2a9pC
	 hRw0C8CZsHdL+4iDEBkvJzyBk93HudUPLFSoHOlr6Uh7G/VfDnnwe3lCqVDU0lJvcDQ3/
	 4u/jJdgmfGbRliHI3A3htwGLiaxLgRiKzG+2z//4prHsedA5otqmPtqH3Nf7ZXwgYjNuT
	 Gu+7fqtHvn2tRKBzWB71B4HSKZYBGEgluzT315jEnSibkyh2LirIuKScF4EtOL3SGwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548043;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=;
	b=342J2pvwtEOusyj521hwLezvJZ7m1AbI0Qh5giYqOl4xArCAWdE0lQC1/3RJ35BP1CuE
	 Td8HrcZD1tuOxK0rVavLSxT4am3hgO6nMgCTGi/Tb72X0Ec7Cs7qPZ8VTt60ocEZuKm3q
	 VjQw4us1dZR+9mRHt5ykATEdrJdYJwRMunHrmqzc+Egoi8VtrQDgLpLIv7XL2QP9yuakJ
	 s3OSVtFcwhtmmkToZH9hkg8P41ypMDbJwrKw0eqDlYyKsl1H1JEO3ydP5i6TuGzn7bWmf
	 /x8VKECpNleGShzF4ka+V3caHMQGUYuE0JTuC2uI+UvzcyV0yfikGcpx53fWtJz7YMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lMUQp9eN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kph5yZzW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECA860A2621
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EECA860A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lMUQp9eN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kph5yZzW
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Ag23717466
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=; b=lMUQp9eNOOiSx0LA
	RtcG44Asgna7uty8EBNJaAquk3523ltxDXQ+K+xtSPNlEdn/maE6e37+ZhiqgOJf
	1FDrMuzEdhCCh4K4F3Pk7tp3sJdDuozu2vB/mq2i6fIcdcdmR4IOgMJrjL2V2iog
	NBJBgLG4y1Ajw+lE38jzkShKZW/9X26FI59qXgAa1fTYVOXqRFjr0xu9mQFhfX7I
	uWVg8iPgthO762+WecURKrx9mhvifntjbh21jogbYgNjubsij5irAkELIS0cCIac
	t0rxpAupLnOtA9ZPiLfQaKGLHCaKW5Rde0/t4I3QeKcS+/kraunsv0lYSJijOea7
	VVTWOw==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufgwra-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 05:34:02 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-716e54d027dso801890eaf.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 21:34:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548041; x=1795152841; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=;
        b=kph5yZzWleXFquSI/qGpi2S+z4zHEx6xpvvzqC65zMgoRu3spGjMz9fJdIzgih3VTy
         CiDOV42+SbxfLumsPTcd8ojO3B+7e/I+csEIhWlaf6Z7WVR3EJA4dvrEKVBEFvDqtQju
         gBjTjasW5aXHeSsS5RBT7WBa9L+Iqh7Ajsn8D3ZdS5wf83QxJUTjZhqzx+IUGelK4iH9
         Qm53kPwz7yq7uROEcC5kPIhtjZ6mmhWHgZTqKCvBhQ2cjabKvnNOVwzznRqHTHFFlvrw
         0Xk55kjhsBy+EpBOm7jaRIVpjePzj9S/hBgEJKw2PHiCJdNUqMAxVp/K4iboOUyZKRCN
         yfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548041; x=1795152841;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3GeqCA54k1HDJk02yNBmeCcl7EY5TbaI/8Y2GXSOGlI=;
        b=nW8TMy3POWcnQTMjIV/QFlXku6ycrtYgVygpqKj6UzpDVYO086puRyo7aFuKasJCHU
         igF3D82gk7xTFO0WFadc/P2hDqEq+Qly8enzyxQ1rmj6NlRS0IcLhmsiQgg638u5z1iv
         OtqlojAEslT+j48rctcSDN3JCE6lwQAcXD1X2CLE9juW6ypUJVrlbvymNZ6DjUEyKFKW
         easRbNF/HdPirz7SSgJ1GMGAht6hDzrh8rzyhl3LgnHB0S3Zc1Fxux5ql1GtKYykg86O
         iWGQan22zW/T1azylgefswLz2ruWCvNhO15h3cwz+mQI8aI4+zbwI36EdTRurMWPYNQd
         130w==
X-Forwarded-Encrypted: i=1; AL+hErEH9FDaTalF1GNx1VY5K4AiTzJXXch/57fr0PfBUCfTqgkOFJRJsGSdio9H7krLVFxwTQSepuFFl1Hq@vger.kernel.org
X-Gm-Message-State: APuU4Z/dczjHVscVMZNIVtU4mrKlRMUSXGeEq1w7omtvW5zK4yEppmKt
	YPPFjI1elcW6Ay9AYEJpYLwCqeqB3DTFCPMwlR1Si6SnJAHoEqR6O1hmlV9Jay7jiQuSUWcw8st
	1zc4w049KJp7t1mxG2fu0vH3b9faS5SkGhaUzLJ6LwvFhc+Jps+27QCNRYFqPBolX
X-Gm-Gg: AYBFou2gXHC7XdzfYSistp9HJxmgsSLCvhKIzy7OMmva2kU/keNzf9Bxg+ZQJ+JUHU5
	SR6GD7NvOfq1a8KH+whwU5P+MXNJJ51ix32mlTvNINsrSTk6RAJ9V9emeL5MJC8jj5HdhsRbpYH
	y0b5BjSZPx41yAZ2+ra/JdGwy/ERF3BIX4w5ZbAFPXH9pQFpKOgkwiU4/RN56qpz9E6MdPmEs9y
	lS9RHmIhOarjtNJUwFoJOooZH4K1vShzxQnK3Lrduag09L9EIrk548Z3NeOfn6aGpzXHoo/n1+4
	/bZa02j9IJtGVsPgiAp5VYo5ke28qtkj5Ptdcpll9LeJSfPrKNQ7v0a0m3IzC0ymWm7JZqh9L0i
	2tiVewQhTgUYM+8vdoH93E+M6oRkOqtou60y/nURe+XJ85+awiPy/Yns9iBpPZrmr3j9O96Bzta
	Uandezsrn07KdKHW94jlFKf3t9rrLWdnh3lOj1Qhc0+IOs3eZIYjje8c6YVpzL
X-Received: by 2002:a05:6820:f007:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-71ab4cd8533mr939906eaf.13.1794548041410;
        Thu, 12 Nov 2026 21:34:01 -0800 (PST)
X-Received: by 2002:a05:6820:f007:b0:6f8:2346:cd89 with SMTP id 006d021491bc7-71ab4cd8533mr939885eaf.13.1794548040890;
        Thu, 12 Nov 2026 21:34:00 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:34:00 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:36 -0800
Subject: [PATCH v25 04/15] media: qcom: camss: Add addr_update hooks and
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
Message-Id: <20261112-kaanapali-camss-v25-4-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
X-Proofpoint-GUID: WbjrUFzrlWIvSQc-97t3kkizOsAA_0NP
X-Proofpoint-ORIG-GUID: WbjrUFzrlWIvSQc-97t3kkizOsAA_0NP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX+YjL1SlE2EN/
 SijkXQw74am2W5T7/gm85bCvquLFzbYPCLaz9LGQaVDME12OBw+zCTxgxGqTr0TOi4ybCskqH7l
 pCAFxGGaMkmhBO/tJVxzj7/PqCzcHLd6hqWohWqj8CloKtGruOCAXiMU6dSh2I/KSnc8Uc7d7Cv
 sjhL/vHFgu5FjUV4iu+crQsq243a35PW+xI0zmr5k17iykPEnjOpW39vj8Ow2HEM9bAT9ErO63t
 N3nO0yS1N3fKm4NadcCXcspIuXPTC+g9gw2nOfQYZokIKesGeCbqPfXfNDs3mnfHHiD1YJUHH7l
 +6NQOHjNsYz1gTtc4z4PPNmTVfTJKBcsX7KXfS+2T4WZbjcOds/N2RW/rll5ZXtJMW+M3+W6QYG
 Rfo1ONHHmyhfVcEj4vfJwgmJdW45pfQyGx19ttsrtRC/3vYqRpPdhD/mp8XewNWbZn2v7IyHUuo
 YoDRP2+WIbAHXAId4RA==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6a14a cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=8v9F0_qJuxzZnZknmOQA:9 a=QEXdDO2ut3YA:10
 a=WZGXeFmKUf7gPmL3hEjn:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX9IO/kZbsjj4Y
 JVYWSI9MYUbKn2L0hgg/C4zLv5SXyHtqckIMnz+AAcVEE1HbSA7dU8Id7iUmx29XaGRDuWBxFEJ
 VAzR06tvkqT81CYWEqRAzTGwDsxPfhg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
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
index ad09593f5802..87bb6ef38af8 100644
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
index f8e5cf9f3ff0..9521301ec972 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5047,7 +5047,20 @@ void camss_reg_update(struct camss *camss, int hw_id, int port_id, bool is_clear
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

