Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795161948;
	b=ITFduJdGl/r9FN6neI1lKl9SOnzXZib6GAoUFRKJP6jOQ3h3xqv0bC7aHkcsq9NvH1qZ
	 c8Hc5VDcaUokvdOrR4Qas1URG95Z8jQfFBR+aYwj30ZIQWc2hwNh7FxxS45ZIWzAlrxE8
	 feYdrxUtLK1ouWwTZG/vpp/hwK4aIaGqYvZ9ZkVi91JO4i4gygSJtXnis+HvYxLffHPRn
	 WGGIgRl4/SYhSMX8ZFctg5/m1l1RGMoENwcDzZ5Q08A8lvfAmHtW1sts56CbA714toeAQ
	 KDhorVdQ69HnmVnqjHmQU6tz7T6A9nbk0uV4b/w2OJmPJtuyWzeiu/v3NqQxvWYHYsA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795161948;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XZzO41Ucyd8tV5/TweI3pY5ja7Z1zQxYwNu5Cg8zPo4=;
	b=wraevJOOdIDyM/PqG96TsrwK0nRfrVB84ZPGcFdwf3LNgCielEw3Cynnmfzk4skGxCyb
	 apetepRhn0Yia2TOWVylrnh9pwuhvWIx4NBPOy9dCOyqmXJZiYKfJjPZalHi/oksxqAEU
	 K5mdDqF1wG5lyIY9Z5/IfVZrmwNR6aCEIvrpVky0anYHYa8YrMYhX1AS0RXYapJg178IB
	 ZULYuduSeYVVsj1Ax1XB1kRFGQOcaLhjvKpY8FHeo95dIz0KtKEppPCTerQlMs9QN3WXU
	 9mdM2Y7z6L25GiU3THCJc3L02swyc27aSxl66tUtVyigdhAexCVDOpm17KebaoWwOCQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2nUf+fo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F03F60A2615;
	Fri, 20 Nov 2026 08:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H2nUf+fo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795161948;
	b=O/cg+ZoEkDItqC5bZWp0W+qzHU2QfIBBrVirFY/9WlQ13dP03/ucJKUCo2rMuP2mN5Hc
	 HrIp3S2nL9SQMiD8DvNWZm399UwKmdswEPRToCGVLPiQ5AWDbbqr3+B0W8hl/mgEhDaQz
	 BTxYZ9Yq5wqYfoyz+gCedHXb3QcVjIS9iLURqgOyvrdLfQhp/FkSqzqnk0vZ2+nTh8Hx+
	 ft8/neVtMzIJy0tC/m5V4VK4Aox4h5xSBXtrtzO4IS1WT/Ly/Nnh85x1uFtGZPSGyuCS/
	 sKiockQraVi6k7J0QIdjMx6Hq1C75TfGggXO03Re2sJU/h1Vs2rtWumMyYmQuSF8egA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795161948;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XZzO41Ucyd8tV5/TweI3pY5ja7Z1zQxYwNu5Cg8zPo4=;
	b=UR4N5RBTMXEKmjV68+dMHbEBFc9XZf0+QrEpD50QwASOBauQ6f0Q3/ByQzTeu6qjeBpZ
	 4NBYP1PkAUHuf9IEPCS+seM+HXOhRXXvUZP+2TUCBBem/8VWB/qOyhsk675vpsPp9DAHM
	 H7uQ0jVMuIEiq4CLmpe9BP58OFMarbulz3Gasoz73MtWB/LS1ARTTQfS/8uKZCZ7dk6l8
	 kT0e6HHTr/v4e6/oKYbOGLMdt8zMLceaCbvqfAXLIjeFxOa1aC3dLe2ALaN7tRuKA59hS
	 FccUuUAkrdRxHwJgx1tJKG5aGCt88CX7DRifqQ1yuXMNMvTVVtG7q+9s8BeALY6qX2A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0407A1F000CF;
	Fri, 20 Nov 2026 08:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795161948;
	bh=XZzO41Ucyd8tV5/TweI3pY5ja7Z1zQxYwNu5Cg8zPo4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=H2nUf+fop86UQlK/rYOnLUUqb/8I0U7ZD7daPKoc8Nx6Lx2H/KuXYVoPxkFh8RjLT
	 hEtpyErO5EEMPMUeoQspdf83gB432e/1XazdquF4xP1Z+XQ0PXvChUSRQe6otVVFbU
	 U/7BAX3vvdNNt8+v/T2F3Zl7SJPgZTgWt48S718Qr2cKcvKhQ4TDLJQHLQeHkIv5/1
	 G0ct786m37rQ7x48RjrccKGZ2Iq2JPL25IZzoo26Dqq0kVJ879WQHEHIpRgrOv8E1H
	 lynbXzOfdPTq+pPW4DdxOTAXuKW9ozFdrov7ACw3GsJMts/UqKhZwVni2C84zzQwUx
	 GnsGNyr1QB+GQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 8580B4977C;
	Fri, 20 Nov 2026 08:05:46 +0000 (UTC)
From: Alexandre Rapaille via B4 Relay <devnull+arapaille.atlr-engineering.com@kernel.org>
Date: Fri, 20 Nov 2026 09:05:47 +0100
Subject: [PATCH v2 3/3] wifi: wcn36xx: Stop waiting on a dead firmware
 during remove
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
Message-Id: <20261120-wcnss-series-v1-v2-3-3fed518decfb@atlr-engineering.com>
References: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
In-Reply-To: <20261120-wcnss-series-v1-v2-0-3fed518decfb@atlr-engineering.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795161947; l=2669;
 i=arapaille@atlr-engineering.com; s=20261118; h=from:subject:message-id;
 bh=aNGMzK4TGJR9fdTqFm+U1fGWoLrLo05sBlDTYvgq33U=;
 b=V/0eKlALIO82U1cNEW91q+40K7SfvMwD4HoYijeCYvjPOiUzibGnLGb+rfGHYZMRpgtS7d6/m
 m+QGSmWFvN4Bd6myr/qQVXtpkVmf+61DuNPJ7NF4uZQ8sSeGgBf4JIc
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
times out during remove, fail the rest at once; recovery now takes
~20 s. Testing removing alone would also skip the teardown on a normal
unbind with live firmware.

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


