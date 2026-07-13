Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF64381B02
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783924430; cv=none; b=D3EdmUkaJJqfu/btqOk4nH51BPyn3jCoYseMvwJu4wShSDo58EAj0sPNqQpx+M2Vw2df9tY9usJd9Pq/fztH9ol3XVydkuBs3vZvrDIt51LsJa59LNf7yR7Qvc+S7ZyZDJ+UUoVnVd+I8l/SXyx9DWHXeFR0U2FbXsbRUQDfp6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783924430; c=relaxed/simple;
	bh=aBpC69+QsRh15CfY3z6X/LotXnJw/IfvtS5JH0p+HFU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JeCUWt1Fvl1cFY15ODdkMUmBX+e4acmDndu7q3WAvmHVKhBqRUyuDwMA5OvjNjV15kbk01Vt6LhWQ3FThyzRq+Oya47SpQOXQqUAHkDAeIzS2BNuLN9wp5dTMR8wrAcPqdmD8ABjzJMdOq59HHRcb57kX1p4xPj0bZwa1XuSFZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N90xAxAx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J19aGvQS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N90xAxAx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J19aGvQS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6Nh2N648361
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=; b=N90xAxAxwKG/jqiZ
	KDO8pZErdEcTQrWJPeqQ72LJxS6Bdw5x7Q4eJumopjTJFZgt6duG5vZdXQH4yvsp
	Kmb42AWrkr4mJbhYCt7MUen4A/E6CjRrsh+HgbiFSw34zXeFOVB/zyYE3pRSgyJf
	HyywwwuXogDDFJLuUhYB7A8nUTzsDJgHzmPtJG2Baq8pSkv3tzxvuMagpf5m1g5p
	NZNRnRv3DbrVvoDqXjLnf9atlEmvnEZw668BXXS5dQIxeudW+d1wT4fiUYvbdgiQ
	Juco2P/64m1XT7qTysZLJMrbKMpmO9OGIPQ/A9XuAxqFcgRXHy+HzN2t70wF+FL6
	LJ8qFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbebr4mfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 06:33:47 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-848d21bbb55so2878529b3a.0
        for <devicetree@vger.kernel.org>; Sun, 12 Jul 2026 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783924365; x=1784529165; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=;
        b=J19aGvQSVxCOfbh4Y/0jQzVr5dObRt/rE0fgGyWCu28XO+OVwbrVZu1K2y9Ocq1RCu
         H5f1VBGLx+Ub156F17af8yuTNDi8XaSGCxu/da9jsfUChcJj3tsdyNUlIS5AzHU+MZKy
         bi98kJ28A8Z1wDILMeqk9J/N7N7KMI5W6kEhDG9E8WctQi+OnfJwIqA0tjS4SabvSUm1
         +DpnPDAKd/MpXj/dZZjEEmFYF+xBF/3DrFpwkxJahcSZ+g+e9dVikGGq/pnyJqa6Q7cU
         dfBOvCWRq7eUtyeZfZpWprK5loSpzBw4pqZqjQ64+VGCSh5Mog0pQgUbTbykjKzEThAf
         Uv2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783924365; x=1784529165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rB5Qx3+/q81F2sux+PFoG/ZL4o54CgITNe0u0e8Wrew=;
        b=e1+2eVwDsykpd+FViwlsY97f9JnkMzA9F7+ICH5+C6/ImlM4aCzOja/2mu0dOjOFM8
         Ekd0YO7nTjeWMTxv+4nMoXx0SKwNYa6XyrS9GiSqhmDI7Zp8Ru0jjAMLmvypv6APTcuN
         LZ3aYXMQObfA0VaBVYqjlD07XCjaTylC9uxCsqitXb1t4DqQOGtkth7copxij2qyq/tx
         JJbNb+Sy3N7ErabYG8bvoi7WgeBEdTSNRUCh9czPOTgPagQqiCop3MpA1xJDjjGkmEo/
         C45Xeb0oKMxXJotccrUd9tfOWcpoXew31uyeQYcqZYT3uEiDElESLAmCyF5Y/AO3CG4v
         O2Sg==
X-Forwarded-Encrypted: i=1; AHgh+RrcCGIeffmvNNIbXy7v8f/1h7ypWQDq/iY2ApMPsoeD8vmYvH9h9UkMhgYwbOYT0Ea0Hokhvwk2L0bR@vger.kernel.org
X-Gm-Message-State: AOJu0YyXei4iBXbHupFLNWlBKUOLNhFIHyneVjL3s8TQYzaz11fZBAS6
	JhxJxoYPDmTQRNNlS8/x9hho3vgbQOeV61jK94P3w19Xe6DpqS5a89UAVl1AKzAeBkwLq4bEoO3
	VlABY0YSf3yfrL2PgFKEeGaquUHxv3OrxzCJR0Kbi1UXqb0lOnGglU97163sKAi1+
X-Gm-Gg: AfdE7cn9ogtm8G841QPPSVtUd0Fd/XfGXR+m9quUIM0j/aUZkD2JLtgm6kAD9+gi6Do
	D2XT4k7uirEbdNoaVa/mUDVkyw3YrmxEFjS4chV+XuPtpv4Q09bJJJfgnoGuFsYgLLasJmEAciA
	stbZvu/vzki/i64jOx1Gf5ovyDQQnyykLES/DwD6qf9xpFWZmT9uHFLxRWrv0OoacGH6oqtd3BG
	zVRBGNj3OY8ELHy2x9DXPralMgi7hS2zmqzaYBQy1VThQvder/p9DgbpmMQ+qXbzoqC74gDtZ0c
	oDJAJFm7o+QIgQwUiC+idy7Vcti7GiEIKEK5Du63xxoZKjKyrZCS0lZr+xpsy042vRs29bjygqU
	ysnA88/1Y4ZbpjwkfamzXXTLFGSJHza8dTAwloOTRvwjyOoYGNee9Ov/ZNafaCo9sfECXjQY6ku
	0aleFudXcAk/hFlA4CAiTu13XGj9CsqXZF30Vc3hde
X-Received: by 2002:a05:6a21:3383:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c1108b490emr10223269637.17.1783924364775;
        Sun, 12 Jul 2026 23:32:44 -0700 (PDT)
X-Received: by 2002:a05:6a21:3383:b0:3bd:229c:dcab with SMTP id adf61e73a8af0-3c1108b490emr10223236637.17.1783924364350;
        Sun, 12 Jul 2026 23:32:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b87b92b27sm25435361c88.6.2026.07.12.23.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 23:32:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 12:02:17 +0530
Subject: [PATCH v13 1/6] firmware: qcom_scm: ipq5332: add support to pass
 metadata size
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-rproc-v13-1-41011cbcda3e@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
In-Reply-To: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX/jJgbd9ei5Pm
 s6BjEyGfLgyGbt3ys8aljTqFQf9GB19N8oYTG0BG3BVJYh2fd2z5P4NIs5EuB1KXqrOeBLdszBA
 +xN03Of7/yU+FbfLLyhQSjNCW5goQCc=
X-Authority-Analysis: v=2.4 cv=OK8XGyaB c=1 sm=1 tr=0 ts=6a5486cb cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Hho1wTqgLjreKoR7ChkA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: yvacaqMa9L7SoaKEjyVbdAzd4HwL-dC-
X-Proofpoint-ORIG-GUID: yvacaqMa9L7SoaKEjyVbdAzd4HwL-dC-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA2NiBTYWx0ZWRfX0GYFXj+0D42A
 toLt4KprtO9dHWNMsYE5sVFN7LoXQDKW4DbGFL3q5dd86SdDsXeLDKLZWcRbbq4iGfpNFHZY/Ik
 QaWRpQcbJ1EYg2/dyvUgL31hShUxe5Lpf4SAzAHebvIOb4R5Y5k01bjV5lVLQuTh/TZsbWul5lk
 9qpY79U68kNgk+Yk4lTJO+SG4bxDMz/x9UjVCtZodn3nkfCl9jekdjImUvHz82HO867Ol0D4eWw
 uS8hrz88WPR5EtDX42rPM4MtHVjwskOUDjECLq5+q3LeCVU5h7EyspOuwdiUhDhCDaEi3oBahD3
 euO47RwxYkEE7uJUDkUUXV8duKl07uVBBohUBUKvpdplyZ5zdDt1EibGcFlWuNDwUTLGe/+tgbG
 vo8Mm3kbj+92S5THV9J2iJLK6tQIy2PmTgqBzTQWSGNzTb77voy3C5GjeGvOsk7d6CkWsYjyi8K
 ua4avf7oqAuLmNQSANw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130066

From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>

IPQ5332 security software running under trustzone requires metadata size.
With new command support added in TrustZone that includes a size parameter,
pass metadata size as well.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 14 +++++++++++---
 drivers/firmware/qcom/qcom_scm.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 7933e55803dc..4a51d2a2b519 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -575,7 +575,7 @@ EXPORT_SYMBOL_GPL(devm_qcom_scm_pas_context_alloc);
 
 static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 				     dma_addr_t mdata_phys,
-				     struct qcom_scm_res *res)
+				     struct qcom_scm_res *res, size_t size)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_PIL,
@@ -596,6 +596,14 @@ static int __qcom_scm_pas_init_image(struct device *dev, u32 pas_id,
 
 	desc.args[1] = mdata_phys;
 
+	if (__qcom_scm_is_call_available(__scm->dev, QCOM_SCM_SVC_PIL,
+					 QCOM_SCM_PIL_PAS_INIT_IMAGE_V2)) {
+		desc.cmd = QCOM_SCM_PIL_PAS_INIT_IMAGE_V2;
+		desc.arginfo = QCOM_SCM_ARGS(3, QCOM_SCM_VAL, QCOM_SCM_RW,
+					     QCOM_SCM_VAL);
+		desc.args[2] = size;
+	}
+
 	ret = qcom_scm_call(dev, &desc, res);
 	qcom_scm_bw_disable();
 
@@ -621,7 +629,7 @@ static int qcom_scm_pas_prep_and_init_image(struct device *dev,
 	memcpy(mdata_buf, metadata, size);
 	mdata_phys = qcom_tzmem_to_phys(mdata_buf);
 
-	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, ctx->pas_id, mdata_phys, &res, size);
 	if (ret < 0)
 		qcom_tzmem_free(mdata_buf);
 	else
@@ -660,7 +668,7 @@ static int __qcom_scm_pas_init_image2(struct device *dev, u32 pas_id,
 
 	memcpy(mdata_buf, metadata, size);
 
-	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res);
+	ret = __qcom_scm_pas_init_image(dev, pas_id, mdata_phys, &res, size);
 	if (ret < 0 || !ctx) {
 		dma_free_coherent(dev, size, mdata_buf, mdata_phys);
 	} else if (ctx) {
diff --git a/drivers/firmware/qcom/qcom_scm.h b/drivers/firmware/qcom/qcom_scm.h
index caab80a73e17..cb80e22a3d90 100644
--- a/drivers/firmware/qcom/qcom_scm.h
+++ b/drivers/firmware/qcom/qcom_scm.h
@@ -105,6 +105,7 @@ int qcom_scm_shm_bridge_enable(struct device *scm_dev);
 #define QCOM_SCM_PIL_PAS_SHUTDOWN	0x06
 #define QCOM_SCM_PIL_PAS_IS_SUPPORTED	0x07
 #define QCOM_SCM_PIL_PAS_MSS_RESET	0x0a
+#define QCOM_SCM_PIL_PAS_INIT_IMAGE_V2	0x1a
 #define QCOM_SCM_PIL_PAS_GET_RSCTABLE	0x21
 
 #define QCOM_SCM_SVC_IO			0x05

-- 
2.34.1

