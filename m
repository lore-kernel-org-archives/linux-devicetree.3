Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795013896;
	b=xgC2tzg9TJ0rJqGFABIderab2l64vOBGxuxcvjgYkvPSRxTeJucYdbt4eMghdrksHD7w
	 zAgT/+vWM/zqpi4VM6hQ3vhsA8gTFXFzmqwbjbGW5Vt/HuIUjLh8hLuZXZBrFFP4lmbvv
	 qPmHGXoiApEc7UD8rCZy7fe3mUIl61wNWT5y94UaeMFr5gAVUsRuiyoty2r/ngWM2wfDB
	 11JlNnP7epYH7bu/Eu3FWIUIPQwGNwIdysxNUebmjqjc50izzYn916MI3e83OAONvSzRn
	 1KD8Fk//TPfqRCcNuF1Bpn2TIonaiYUfz0lgMrKSqFMYzaP3YdAw59yfOcpgcquHb0w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013896;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zIt1ASrbnOGcLtW3sl2rVdTEUS+/vIWkbm6UJtqJ7ak=;
	b=sIkZthNWybP4hU9Roc6F3MjQcIy6xwky4mDE5tN+xxwez7VaYtQrfcDJ/OrQp+sR3urW
	 y+ZyWWVM9PHONn6q9O3t+L7yhIdmxUe3ubL364KdKwgk3XwfwSC1b2o47f4egIUyr/5jy
	 Yoq1SlmcRHLlRiEYfTsKzWCijOr2b2TRIk2e8JUGBd/xBzLREJkcP7CMFUF2nj9L2uZC7
	 xlnolM6c0cv3IxYLYRTHwnFBKagJ/+qrty4Y1voRxdC1+lr/CvMH26KGSOWUmp6nxtij2
	 6RJRoQqOs2AnFdNH4iayJMR0arSM6z5wunNdsJovpB0Vr1cskXttHL3qCNBMFoK/uzQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ka+CL7fJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B402E606A325;
	Wed, 18 Nov 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ka+CL7fJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795013896;
	b=KtR4QxqasG6BhfDrOBn941GA25PhM2XF2vGe+5oFHTTytK9z3lkfu64aJWqiDYWETbVp
	 3NNyNVCj88gXSPCMcHIdRBbB2J1B0kL9ZW1Bu3oloVmbAUy61LadcwR3SCiybDTagnLsn
	 tKZ/zJsWDQ64zhbLuwljlP47ofdsnKAPU/N+XTITFrWhRTeHTlWaNGbxZ3AwwrFTkIFk0
	 vKTiwEwFoJNIoYARDtcqon5hFz+bRnq1INlnUzbm2xb8/9ss7+eZKNXHvl6n4UTakw9xP
	 u7W8EEOqciJh5a2oASSR4vmj1PP3CFmlYtrcu3ZbwleX78+cpZzqmr58+PNw6bYzy9A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795013896;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=zIt1ASrbnOGcLtW3sl2rVdTEUS+/vIWkbm6UJtqJ7ak=;
	b=IZYbIiEdqBizGEBOs8m3Fi1TpRjlPVufV4SlIUT4q2IWeszFgWe3Jw6KQnfD99/zQk24
	 5yxWXQs/vVEK6T6vq8cxKlgkjI60VXV0sVNou/5xnPTAQPrsH/YKXvIRhfpIRs8+iyd3G
	 Bs+LBwGvBFZH0JiU7JFIG5TLwzFSgVFEBKyfkegaqG+KmGrpnV5az11DLqew0Z0gLqUe8
	 K+bMZBteQMx7cwzb3IB3G2489xEW7iTtavCVrCh4MvF1b0mYsNKvCKn43nommfIaQOrWN
	 JtBNsX2aoVkNrecHzhTd/hCBtQXx3YQeVCWtyGSiBidiFU2fGUoZnM6mjzunO1Kqftg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 982451F00926;
	Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013896;
	bh=zIt1ASrbnOGcLtW3sl2rVdTEUS+/vIWkbm6UJtqJ7ak=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Ka+CL7fJXSmJOzwXzugmS+lD0iH4UcS+TZbjFhGaF1UUrH8EDKk3Iz43LB4gWlLnK
	 hx7fYGQ73bp5LBie0YAJBIYt0rfd3qRW9uUey4eW7d2QKON13cGKjRuRvOTKeLWlvp
	 dMVutWqaOAXMZygbarH6Sd3bdskOybHjv46pUe9bJiFW8bN6McHWDNezTp++lTEINN
	 GdjGCtNqr36JGJBku/5hgw1HBtvuWhaUkzHD3JuwEwzOg4cvWqJ/ivYEUB5H/XokkA
	 wJNx14xcKlDwqdyTRrFtL7T7atfCaZJU2PQfLM5J3hcVqIbotBlIVE6QCVZ4F0foRM
	 qriE1PQ+iEOTg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2026B4AE04;
	Wed, 18 Nov 2026 14:58:13 +0000 (UTC)
From: Alexandre Rapaille via B4 Relay <devnull+arapaille.atlr-engineering.com@kernel.org>
Date: Wed, 18 Nov 2026 15:58:01 +0100
Subject: [PATCH 3/3] wifi: wcn36xx: Stop waiting on a dead firmware during
 remove
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
Message-Id: <20261118-wcnss-series-v1-v1-3-a64d82e151bf@atlr-engineering.com>
References: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
In-Reply-To: <20261118-wcnss-series-v1-v1-0-a64d82e151bf@atlr-engineering.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Luca Weiss <luca@lucaweiss.eu>, Eugene Krasnikov <k.eugene.e@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, wcn36xx@lists.infradead.org, 
 linux-wireless@vger.kernel.org, 
 Alexandre Rapaille <arapaille@atlr-engineering.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795013892; l=2576;
 i=arapaille@atlr-engineering.com; s=20261118; h=from:subject:message-id;
 bh=OWtB8gLUHR0gZZyDT6Sr85NMnedCySghwg3+i2hEYMk=;
 b=40vQIVIHDiOrrWXDECYvU5u3JJRHAVNJeUedW0JPVJCgi5Xofe0K70qQvMCKg/EHM6Bza2uQk
 +hoPHbqb31UD0khKmRPYS2s9xX9yNGInY/QjftvDjjtkHMEQzsXZy8B
X-Developer-Key: i=arapaille@atlr-engineering.com; a=ed25519;
 pk=xskH/sIiNU/aZCeGeBB1TK/AuiG3MXlX0m2wMlbMl08=
X-Endpoint-Received: by B4 Relay for
 arapaille@atlr-engineering.com/20261118 with auth_id=1560
X-Original-From: Alexandre Rapaille <arapaille@atlr-engineering.com>
Reply-To: arapaille@atlr-engineering.com
Content-Transfer-Encoding: 7bit

From: Alexandre Rapaille <arapaille@atlr-engineering.com>

After a WCNSS crash, remove sends ~16 HAL commands nobody can answer,
each waiting HAL_MSG_TIMEOUT: recovery took 160 s on msm8974. Once one
times out during remove, fail the rest at once; recovery now takes ~20 s.

Signed-off-by: Alexandre Rapaille <arapaille@atlr-engineering.com>
---
 drivers/net/wireless/ath/wcn36xx/main.c    | 1 +
 drivers/net/wireless/ath/wcn36xx/smd.c     | 8 ++++++++
 drivers/net/wireless/ath/wcn36xx/wcn36xx.h | 4 ++++
 3 files changed, 13 insertions(+)

diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index ad8a4bd910..77a1029108 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -1651,6 +1651,7 @@ static void wcn36xx_remove(struct platform_device *pdev)
 
 	release_firmware(wcn->nv);
 
+	WRITE_ONCE(wcn->removing, true);
 	ieee80211_unregister_hw(hw);
 
 	qcom_smem_state_put(wcn->tx_enable_state);
diff --git a/drivers/net/wireless/ath/wcn36xx/smd.c b/drivers/net/wireless/ath/wcn36xx/smd.c
index c0b4773458..d07ea967ac 100644
--- a/drivers/net/wireless/ath/wcn36xx/smd.c
+++ b/drivers/net/wireless/ath/wcn36xx/smd.c
@@ -427,6 +427,12 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx *wcn, size_t len)
 		(struct wcn36xx_hal_msg_header *)wcn->hal_buf;
 	u16 req_type = hdr->msg_type;
 
+	/* After a WCNSS crash every teardown command would wait the full
+	 * timeout; one is enough to know nobody will answer.
+	 */
+	if (wcn->fw_dead)
+		return -ETIME;
+
 	wcn36xx_dbg_dump(WCN36XX_DBG_SMD_DUMP, "HAL >>> ", wcn->hal_buf, len);
 
 	init_completion(&wcn->hal_rsp_compl);
@@ -440,6 +446,8 @@ static int wcn36xx_smd_send_and_wait(struct wcn36xx *wcn, size_t len)
 		msecs_to_jiffies(HAL_MSG_TIMEOUT)) <= 0) {
 		wcn36xx_err("Timeout! No SMD response to req %d in %dms\n",
 			    req_type, HAL_MSG_TIMEOUT);
+		if (READ_ONCE(wcn->removing))
+			wcn->fw_dead = true;
 		ret = -ETIME;
 		goto out;
 	}
diff --git a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
index 8c43f67bd7..9e5f3918ca 100644
--- a/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
+++ b/drivers/net/wireless/ath/wcn36xx/wcn36xx.h
@@ -276,6 +276,10 @@ struct wcn36xx {
 	spinlock_t	dxe_lock;
 	bool                    queues_stopped;
 
+	/* Set in remove; a HAL timeout then means the firmware is gone. */
+	bool			removing;
+	bool			fw_dead;
+
 	/* Memory pools */
 	struct wcn36xx_dxe_mem_pool mgmt_mem_pool;
 	struct wcn36xx_dxe_mem_pool data_mem_pool;

-- 
2.43.0


