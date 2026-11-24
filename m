Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795542186;
	b=p3pn95ktGLJumrdFjX0U9uipah92kqsmJgvc5dh9xGhFPiQFTobGtf+M3QXgKrbmpmEA
	 ZnrHdNurPFGmFl9pByhuZGRn+b/axvzZ+br7p9bxPRAO+vUoYEdhEj7uGHjf0ELQDJL1e
	 nGZtMFEy1OTuACTu6PKuoqQadLxmGlGejzfwLNK0XTofUAyvmxpgYW9GBEageer4yooxN
	 tutwuiBbLN0R+jZgpUX1OjT4qptEeZFe7hiB2nmGxNJiPOAPnEesTPvTWQDe+ixa5k169
	 2Bv5G88w7RlyQOI+gHzzj5tT5q+dH+w/o3a8ppFsEUbp5UwHiELfFXEvA437Pxrg+rQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795542186;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BmeSP8HjYQ5cRDtQ/CR1hWVAr3pmfYIadN9wiyMqhmA=;
	b=5NHKTXIRHhSX3gk99rihH/eJuH4+uOotIW/3S8qAK6YvWy0P57bImoPXkXgV4UGPPXny
	 K/BhBwwHjFpGxi35zI93P0ko3h+8asu67kmzziTSn6+kp3lEcphScHyHsXhRsHFaMDv8P
	 AkU/8GAtqxvyjPyWfLg3LCwf2wnp7fs00kNmB+pAtaSqIG6QnAUZNr5xg2NyBnDiQMZxI
	 pjgrFLss8i6TOORBG+WiaiKdaJBJNSEgNc+4xFxa4bY+9eucu/HZM8EHybW69lvKWs4Jo
	 L0cFfzS2oNxzoGyAzWJaZDptH14ZLn9O0fQU84GTvl7SVINm2ixqh7QBTF5JyFAQCNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFvQ2bAV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A46B606A329;
	Tue, 24 Nov 2026 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fFvQ2bAV
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795542185;
	b=RINpyr8yd4hQ9KgU5l/nGIukTvOjXkEeuzW+OroX+tzeX5yQTL1m4VEHXr0q7oEqX6DV
	 gW4F+A4R1tsr+F4jjm+M9E76azMeQVNcMbgTsBRJ1xU/Kr994YOEJqzuqv8qvXL5x+ysR
	 oim7L+JVDXCPLDRAWVm7XIrAGMkyavAccaxlQ0DY3FUrN6gB5qken3OyuIzitN21a4jf0
	 jGbxAqAekCGrj3m0a2bouIIVrDDn7Jpt7qENE3/xXDDLl6l3MrfSpUK1gO2IrKBn1z5Hb
	 Ytvr5IhcSmT69bpIDRRTjljb+ZkCiPQ98Acd1UB5mC7TZBBo+pO4q018+NZmIBQ3PHQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795542185;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BmeSP8HjYQ5cRDtQ/CR1hWVAr3pmfYIadN9wiyMqhmA=;
	b=OEiq7KtG/Xt2J0kupC9nyzYReHdBqPJMmqm53Bdev6yxBQlcSNPqijdS00C/N1qwZlR5
	 jPvY60qfETQmn9KmzV1CqBWZCTxnjOF870toetsuWWffPLiQDEpVPquvBV5bcIu8+qm/j
	 SjSAT0QbhNuVtn4NIdenf0h3on/Ifj4Tr54omHIenmXwwTaTI2MGBFI8cRrPaWt3BiUBd
	 7Zd1d4IS8vy0bYiVkwm3bv4s6tsMohFMF4LHCqxeaqiW7MFGBlLrX1ziaOOjRTq7fgeK+
	 Mu/TAYxjVBIsZ2T94GL0Ibb3iaRF6DbzdQ4+UrTUps29Y9kqWepBzlar2maZzVl+p+Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F5C31F000CA;
	Tue, 24 Nov 2026 17:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795542185;
	bh=BmeSP8HjYQ5cRDtQ/CR1hWVAr3pmfYIadN9wiyMqhmA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fFvQ2bAVAF3MKnHzqR9W6Vp/N3LJUbEcNKj70Chd5j/L1jHRMyDJBhQxlcQ9O4dva
	 xSSPawI4DpdmczlGkE5V1ML1vLWN/mU5e0EGCNV4sU5VSAuJxan3hn5aI1DM/HyDVN
	 jR96aIhqMLzJ+25+RBNYbHZFOISf6O+Dfv2GCuvieSLQ1rftVtV2QDxT8W/25wvejP
	 /hBBTXQKQclXJ2Vok7y2cxPyIo3dXxnOQO1mqlY/Kkw48xeFtnr+hguWWYt5JcednF
	 k4lInRWFJU+jfyki/frlI7xg9foqhM6kHSfFh5BdoTJ1RSDGf2lzG9xIdr4+YhXwSN
	 8sDMR8bU00oEA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id D92FF4CB13;
	Tue, 24 Nov 2026 17:43:00 +0000 (UTC)
From: Armandas Kvietkus via B4 Relay <devnull+armandas.kvietkus.proton.me@kernel.org>
Date: Tue, 24 Nov 2026 18:43:00 +0100
Subject: [PATCH 1/4] firmware: qcom: scm: Add QSEE app start, shutdown and
 services image load
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
Message-Id: <20261124-fpc1540-tee-v1-1-6c6985f05b06@proton.me>
References: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
In-Reply-To: <20261124-fpc1540-tee-v1-0-6c6985f05b06@proton.me>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
 Armandas Kvietkus <armandas.kvietkus@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795542180; l=4679;
 i=armandas.kvietkus@proton.me; h=from:subject:message-id;
 bh=kiEq95ST1or3ds4W0ln0vId1q7/z6qUKlXQN7xs7Bnw=;
 b=mibjb2GFW5pUbiegvhXEERwzhRGEtTzhh30gjZSjZIUx33OnOAhq/S1LNjdcEGM5APLCKpsvZ
 3wo/0RLRLKwAlWq74G8V9CsmoPGYABt6T3ZEQgVfypJzz1yzUN4O9pY
X-Developer-Key: i=armandas.kvietkus@proton.me; a=ed25519;
 pk=wuqmImJ9sKlDVcwALOvfGhjj7G8EBjjM4TpCdmlrAf8=
X-Endpoint-Received: by B4 Relay for armandas.kvietkus@proton.me/default
 with auth_id=974
X-Original-From: Armandas Kvietkus <armandas.kvietkus@proton.me>
Reply-To: armandas.kvietkus@proton.me
Content-Transfer-Encoding: 7bit

From: Armandas Kvietkus <armandas.kvietkus@proton.me>

qseecom can only talk to apps that are already running in QSEE. Add
the app manager calls to start an app from an image, shut it down and
load a services image such as cmnlib64.

Signed-off-by: Armandas Kvietkus <armandas.kvietkus@proton.me>
---
 drivers/firmware/qcom/qcom_scm.c       | 83 ++++++++++++++++++++++++++++++++++
 include/linux/firmware/qcom/qcom_scm.h | 23 ++++++++++
 2 files changed, 106 insertions(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fcb04441dd52..979e101280b6 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -119,6 +119,12 @@ enum qcom_scm_qseecom_tz_cmd_app {
 	QSEECOM_TZ_CMD_APP_LOOKUP		= 3,
 };
 
+enum qcom_scm_qseecom_tz_cmd_app_mgr {
+	QSEECOM_TZ_CMD_APP_START		= 1,
+	QSEECOM_TZ_CMD_APP_SHUTDOWN		= 2,
+	QSEECOM_TZ_CMD_SERVICES_IMAGE_LOAD	= 7,
+};
+
 enum qcom_scm_qseecom_tz_cmd_info {
 	QSEECOM_TZ_CMD_INFO_VERSION		= 3,
 };
@@ -2220,6 +2226,83 @@ int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 
+static int qcom_scm_qseecom_image_call(u32 cmd, phys_addr_t image,
+				       size_t mdt_len, size_t img_len,
+				       struct qcom_scm_qseecom_resp *res)
+{
+	struct qcom_scm_desc desc = {};
+	int status;
+
+	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
+	desc.svc = QSEECOM_TZ_SVC_APP_MGR;
+	desc.cmd = cmd;
+	desc.arginfo = QCOM_SCM_ARGS(3);
+	desc.args[0] = mdt_len;
+	desc.args[1] = img_len;
+	desc.args[2] = image;
+
+	status = qcom_scm_qseecom_call(&desc, res);
+	if (status)
+		return status;
+
+	if (res->result != QSEECOM_RESULT_SUCCESS)
+		return -EIO;
+
+	return 0;
+}
+
+int qcom_scm_qseecom_app_start(phys_addr_t image, size_t mdt_len,
+			       size_t img_len, u32 *app_id)
+{
+	struct qcom_scm_qseecom_resp res = {};
+	int status;
+
+	status = qcom_scm_qseecom_image_call(QSEECOM_TZ_CMD_APP_START, image,
+					     mdt_len, img_len, &res);
+	if (status)
+		return status;
+
+	if (res.resp_type != QSEECOM_SCM_RES_APP_ID)
+		return -EIO;
+
+	*app_id = res.data;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_start);
+
+int qcom_scm_qseecom_app_shutdown(u32 app_id)
+{
+	struct qcom_scm_desc desc = {};
+	struct qcom_scm_qseecom_resp res = {};
+	int status;
+
+	desc.owner = QSEECOM_TZ_OWNER_QSEE_OS;
+	desc.svc = QSEECOM_TZ_SVC_APP_MGR;
+	desc.cmd = QSEECOM_TZ_CMD_APP_SHUTDOWN;
+	desc.arginfo = QCOM_SCM_ARGS(1);
+	desc.args[0] = app_id;
+
+	status = qcom_scm_qseecom_call(&desc, &res);
+	if (status)
+		return status;
+
+	if (res.result != QSEECOM_RESULT_SUCCESS)
+		return -EIO;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_shutdown);
+
+int qcom_scm_qseecom_services_image_load(phys_addr_t image, size_t mdt_len,
+					 size_t img_len)
+{
+	struct qcom_scm_qseecom_resp res = {};
+
+	return qcom_scm_qseecom_image_call(QSEECOM_TZ_CMD_SERVICES_IMAGE_LOAD,
+					   image, mdt_len, img_len, &res);
+}
+EXPORT_SYMBOL_GPL(qcom_scm_qseecom_services_image_load);
+
 /*
  * We do not yet support re-entrant calls via the qseecom interface. To prevent
  + any potential issues with this, only allow validated machines for now.
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index a0a6bc0229c4..1027907e27b0 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -143,6 +143,11 @@ int qcom_scm_shm_bridge_delete(u64 handle);
 int qcom_scm_qseecom_app_get_id(const char *app_name, u32 *app_id);
 int qcom_scm_qseecom_app_send(u32 app_id, void *req, size_t req_size,
 			      void *rsp, size_t rsp_size);
+int qcom_scm_qseecom_app_start(phys_addr_t image, size_t mdt_len,
+			       size_t img_len, u32 *app_id);
+int qcom_scm_qseecom_app_shutdown(u32 app_id);
+int qcom_scm_qseecom_services_image_load(phys_addr_t image, size_t mdt_len,
+					 size_t img_len);
 
 #else /* CONFIG_QCOM_QSEECOM */
 
@@ -158,6 +163,24 @@ static inline int qcom_scm_qseecom_app_send(u32 app_id,
 	return -EINVAL;
 }
 
+static inline int qcom_scm_qseecom_app_start(phys_addr_t image, size_t mdt_len,
+					     size_t img_len, u32 *app_id)
+{
+	return -EINVAL;
+}
+
+static inline int qcom_scm_qseecom_app_shutdown(u32 app_id)
+{
+	return -EINVAL;
+}
+
+static inline int qcom_scm_qseecom_services_image_load(phys_addr_t image,
+						       size_t mdt_len,
+						       size_t img_len)
+{
+	return -EINVAL;
+}
+
 #endif /* CONFIG_QCOM_QSEECOM */
 
 int qcom_scm_qtee_invoke_smc(phys_addr_t inbuf, size_t inbuf_size,

-- 
2.56.0


