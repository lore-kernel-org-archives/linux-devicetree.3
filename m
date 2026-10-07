Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 022D446A608
	for <devicetree@vger.kernel.org>; Wed,  7 Oct 2026 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363666; cv=none; b=uMTgK+1775WFQxFzcsY2ZXR9GTPiY4iD/qCXDgxFz4Mk1KRS/UX825fz5Y9al22mZ176BMTtjGuBJyQq7jviY6VUfA8vVSAqDby74iNA7KO10BJ6Kuct70fhky477jwK6jDKOkCL5NK1MGFe54KKw09ZTxwnIMf5iPPspVSdm+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363666; c=relaxed/simple;
	bh=o+pArcNbJmp2jNe5MdLimuBeqxq5vqZqEf7oThdS1No=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rhBD0vqdJqO/LuR9Vhnz/if/BrNvDJ8YSm+6Jxb0W+JHrB6hu88zfHIe62Ud3gB7WO4o1JuxRydKcSjqXu8XU1c+Z/Odte+SGrvR2MkO12ZfXngVzY+7qKFiwKGzBbY90KoeViTeUu8QFxc5RPsMTvXkNxA/zfmUQzR82H+XHJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f5qOJhLg reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f5qOJhLg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jRih118860
	for <devicetree@vger.kernel.org>; Wed, 7 Oct 2026 09:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0S3PID9SQK
	AbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=; b=f5qOJhLgqYfx1alyOWBqLPh/23G
	MKD8+LsUXULbmgU8067KVe9KKvQebysD6zGihBJf1itBOUDrwB1AYbLcoDDk1bSr
	iCsQcfEF6Rxib3mT1KKqRTWCyGZHXQJ8N54o8OsN51nbVTK444E41iONkq6Woxkx
	cHRpgKRRmliy2xNurRGVnUafXwQgXiNPQVcezhk0KNrQrzulQBABi2Mowz5bIsmd
	Ssi/F9gw2eNwuKk1mtL8X6p8C0IB3EbzCrrBIZmQBvPGJ8dUvJSO1DtbyL3OR0FZ
	8DdDeDLsCwQYBAaIM2JOJea3Eyu/vPHnBs6iIeXqtk6jZIR8kM+Px/ULWtQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5fc58qxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 09:01:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc5f70c8dso422878385a.3
        for <devicetree@vger.kernel.org>; Wed, 07 Oct 2026 02:01:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363661; x=1791968461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0S3PID9SQKAbweaMyZ6e41wAcDSBT7h+cjSF8ADoV4=;
        b=ScinUJf296TFeWJtn9MhEGGM2d5cLtfl9xBkJeN4RWXQpV+QsFjn+F7oZPM6NUBw8R
         WU90FHGj+WLDW8ZZjj4N5NVIamloFCw0U57g17jf+Oqul6m2XNkP6lzfBCbxjRVt3c9P
         CEUMaAX8uaeUk+bVF83bPO6u5mYzj3HpnTssGGPjmJxvuc/aBmdX1Z7uXoEo8aBwtdiN
         1lkMVs5sVFUOx4WFjHbMBi1GcWIjHVGSvPga62X4QrGp96k9WyVL2eZUo3FuwSj3VSeF
         BqHMdW7BAKZs4w/xnu74cfPjc6xCb+5kJY9t63zrcMNkh4QCOzZslXQCYbriKCmqs41k
         7cAQ==
X-Forwarded-Encrypted: i=1; AKwUvBxRgkhFOT5CqO/9ymaxhc5vrdnDkzwDPavIeBY5Om2VnGjHtNXYqeB+CEuAaO4/YKLWyuEW93dGdapm@vger.kernel.org
X-Gm-Message-State: AFuF++ks+SW4iEWvYOze/Gp7Q9c1fU1p9rURE3CZqMoM1wsjFZbev4uQ
	3iG+YlhJ3AdCWE7rENhm0Qm4LogwdPLFQmRJSH8ArbazZsI9TEWyVDiOk4sU9rONiWhteC1ghR3
	yTvbhSOt840jeaq5hBmrU+B70WGQirbNgw8uBm58MI71dnm0CoH2OwPyHdI6gTchi
X-Gm-Gg: AYBFou2x0gzAjspsotxVsL9pB4zPFIIyoGITqO/kQr54DPUk5zdBRWwxavJD10yZ8p/
	3uWxK2MlseY8yr1G2GBxVwZxpJQJOU25jVknoTuQ8/v/voH6U8F6VTKi174u+iZqbQL8dNY2+mg
	Ix0mrPj9Vh9oaJjeup+OOjgR9plrbWSKSuOdhRotGXIVay+huNIAoQMv2tmKxfLtQAPrhmqXIpv
	iYscjRoR4C6MhdiWWylW6OZO2gF0UI/0aj7ofNh3NKeqGkXiN2MyxVLAH9qpIoF+xMGSrGTKoY8
	s+3uI2ywl5PZUWz7QunIEe/SCAJjMbrVgsv7pizzePCON06tVLxayQQvxN4=
X-Received: by 2002:a05:620a:7311:10b0:939:ff11:5328 with SMTP id af79cd13be357-93e9b721defmr197583785a.24.1791363660578;
        Wed, 07 Oct 2026 02:01:00 -0700 (PDT)
X-Received: by 2002:a05:620a:7311:10b0:939:ff11:5328 with SMTP id af79cd13be357-93e9b721defmr197577885a.24.1791363659865;
        Wed, 07 Oct 2026 02:00:59 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.00.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:00:59 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 03/45] media: qcom: camss: keep CSIPHY lanes active while streaming
Date: Wed,  7 Oct 2026 11:59:59 +0300
Message-Id: <20261007090041.3732717-4-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3qVRXW7urif0
 3EGCEEJ9+X4qcne0+EHhyFAL1WqPv8SXvQNXjuOEhe2mlxAysBb4ptNIUnOCeykM6KPoVR3vCVT
 /+KLM+ZQuLtCULL5TThJwY9Kvg8Evbk=
X-Proofpoint-GUID: dQYOBUCqmaOFK3BRaXsaBzkwkBluxnaf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX4SgjjgnF31I2
 ljI7ZxLgqzvCmPAa+pN35w7ndd0nRNgm88bxjdviAFjRLLV0V9Rgo5Qtql9InQN0n5IFv8GbnLp
 UmmKCwHeftOhMsV6xojjrSI/jCLa9G479I5GQX6JRSdq60zaPNzzMZhAzRWW747X/ZfKjzkFqvV
 nDS2nNBGJaPS2wggGI4dFMI65ZmPH3dsezaG9fDw6MFMbcZRlxnrt9YpoBJrihUUR8AKUvXNDxd
 6QkEhIOXiKoUbl7l9m6XgoJonC+jpWCQITczOwoB1YKFrUe1Ck+3RUU+kv5XbmkvNI3FM5JSykB
 Eso4byTn5Z+5Ty6+1CsBzIpDCPzAeUq9wD1ndX0VEn8dKsBYucDrLwxgsEgQwW6Mmtv/aa05c0H
 T8i3XP+947PUcpMNOqxahEwi9vu0vcG6UHlN666nAftI0dUgEx8V+XNxQAnn3wr+Ih753Iy7mtX
 BlwXUR7xUE//QDr+25g==
X-Proofpoint-ORIG-GUID: dQYOBUCqmaOFK3BRaXsaBzkwkBluxnaf
X-Authority-Analysis: v=2.4 cv=a6+lZkSF c=1 sm=1 tr=0 ts=6ac60a4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=0Z5QZsCCh4IwRXeKKPkA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add a stream_count reference counter to csiphy_device. The CSIPHY
lanes are enabled on the first stream start and disabled only when
the last stream stops, preventing a shared CSI PHY from being torn
down while another output is still active.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csiphy.c | 12 ++++++++++--
 drivers/media/platform/qcom/camss/camss-csiphy.h |  1 +
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index 9e95d04b7235..4938e56f481d 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -324,10 +324,18 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
 	int ret = 0;
 
-	if (enable)
+	if (enable) {
+		if (csiphy->stream_count) {
+			csiphy->stream_count++;
+			return 0;
+		}
+
 		ret = csiphy_stream_on(csiphy);
-	else
+		if (!ret)
+			csiphy->stream_count++;
+	} else if (csiphy->stream_count && !--csiphy->stream_count) {
 		csiphy_stream_off(csiphy);
+	}
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index e55c098dbe67..8c1eb83de751 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -115,6 +115,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	unsigned int stream_count;
 	u64 enabled_streams[MSM_CSIPHY_PADS_NUM];
 };
 
-- 
2.34.1

