Received: from mail-qv2-f37.google.com (mail-qv2-f37.google.com [74.125.230.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DA144A387F
	for <devicetree@vger.kernel.org>; Sat,  3 Oct 2026 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050236; cv=none; b=bn1YDFz1juVcZ+47uevlZIbZwHxMQAuZb46VxGmE999AVqgIFcwfdxq2ru8okQVkk8aksYdV74NpEAVHBw7qV1eJXMjH9iIx1v6iGRlzied5Af2SNqb7jAMtGtD8xqYBtpVPLUZC93rI3tkpTLhml/5vrcpNFgAQZiM8j3C7x4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050236; c=relaxed/simple;
	bh=luUnD3l+m2wgA6kRS365Flg21Wuxh5YBD2vT8dfL+C4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MHhFjt7m03lU6sLkLXYCDEhNfAx1YrWhZd7or7jWE+PcnyXHEcnLlZvVVusKcEw3ZBPbq3Tm1CLZxVMPvOeJ4Ey5lcUaHeeCfAx2CzYPhFv9rC0E9eNMYC0IxlYgMTp6CFlh9twtzKU0VHVhg2vC01vQf61AZXxlXQ50sdj+UIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZDNHWmoM; arc=none smtp.client-ip=74.125.230.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZDNHWmoM"
Received: by mail-qv2-f37.google.com with SMTP id 6a1803df08f44-91235f46716so9169456d6.1
        for <devicetree@vger.kernel.org>; Sat, 03 Oct 2026 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050234; x=1791655034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ftY4s8ms9BPT/X/v3xKK/RfT0MsqyQeCqU3eZn1XFPk=;
        b=ZDNHWmoMYSRKmH15uf/0Z8BK4nwDqqDpk/yshCf25Ga2MpR9RUAKQt8mUoN1AgT4Mo
         YpAignPv0zzkTLkBvosCfChNGvR5TGX57A5T/y08rhi2rweaH+4699/GZ4bhW5zbfuVJ
         DeC03pfe3VdctE+9DFxOs6J++uVhseiUbAn8BBxPXpMvzJ3V8AW8I/u+eImQvKlVsLhi
         KUUltvau8d1I/mxgB5hAJD+tZ0gXfR1gzWAHaRr2SH2uonKwyKRWsMak8wjLWFDvsYZB
         BNdgtHI7EdvtaMz2D91qWiwyk+Vwja+1Po/+YTd/3/0vQeHvLuTwYsUp2htSOhkNEoe1
         a1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050234; x=1791655034;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ftY4s8ms9BPT/X/v3xKK/RfT0MsqyQeCqU3eZn1XFPk=;
        b=cYtHSX4MS8tdBxYNz6PARXWKdz97PuhTxieql+OKbInOooKOq26FFZw1NJqqWtUrOg
         WlC+p9f0l6I/3U2OuMOPi6YplO4DiEf9eqZb6nwHJlBnnaB0uQcVCMe2Nr9Ke7XBttc7
         vm6IK+cmkoqPUi0jRqlZMSihpwuZ3yKS2bGaaNpNwTsYjBdBrm/3snZ0oXEjJmzRkgLf
         dQEnZ1D7Rdq8uE6IkI3qfIyJ26dHu4sS+cAUI5V5t8YMxrI/LMpvN6iFInQy6bMNaEm1
         BWzw4y52KHkRw6nuLIPe4twuAAf2V+jkCejWVCMlZhrnzFMdAWYxTJ/02zzCgQoRQobr
         NifA==
X-Forwarded-Encrypted: i=1; AKwUvBxfvCNsyAMCqCNfgyVzhJvZhLb5zMrVBHMMY9fSEQ+389KNkEDEaIno0Tjpg2v8biC+ITjpN2vANG80@vger.kernel.org
X-Gm-Message-State: AFuF++m38RAShrRDKnZ8RR+I+8t+XKE9sKF5R7b3Nh/u1emjTCfTSEAN
	vM1S0m6XP0LkZBf0P1yVC/irYwsUPsZFqrFYVTF+en40IStWq45HURJg
X-Gm-Gg: AYBFou0nXSOwd6ZpWheTB61OQ86kiMJG7r9v/jDAdhW0WhjqLbEY5jveuAjIKuVGMBU
	ve6B64GpfW2chtWVaFtmNgtkwBBE3NcWsqdRHP4QMCywDZBwvAzk2yT8SSQkVmh46hDKMO4SDGw
	NydWZL2D/zznT0Fl7z30/RpzLbjBfyXHXeGHFVSSLAghFug2obiXg7r/roKEdvvty6kyCNgwsaN
	8yxu5BaINytapLqNgAx5xTSOY7mPaDm3RtYFDnjw8fsAFdgYHsOP415UiBwFaFSEieRQQ/VkR/O
	1fxwd75zvYz0dn7Zq8aJlqRp6hQ9+I88+el3Xfrh5tn8Zj/vOUPhXavrdgbC1PNW219iSHijnOu
	3+ZQxr74AZyK3yra6Vp9Ziau6jCetqOCYGosIGQsu4HH07LqXSClswtE7f3+cXLLN1x+LkK+HyP
	EjuNWjH2vZBIyloqeku6LN2wp7y8kCGlWoFBmzChml+Mp9h8Nqr/2HBTwU5/OqxXVJnEEqWnnb6
	A==
X-Received: by 2002:a05:620a:6601:b0:93a:1264:7f46 with SMTP id af79cd13be357-93cf189ed93mr1216539985a.46.1791050234126;
        Sat, 03 Oct 2026 10:57:14 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93cca2d361bsm507217685a.45.2026.10.03.10.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:12 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 06/11] remoteproc: qcom: pas: Add SDM670 ADSP support
Date: Sat,  3 Oct 2026 13:56:54 -0400
Message-ID: <20261003175659.23536-7-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ADSP is used to control audio and sensors on the SDM670 SoC. Add the
compatible for it, with the same data as SDM845 since the driver
requires the load_state.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index ca8e61254c44..5272a462fc49 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -1865,6 +1865,7 @@ static const struct of_device_id qcom_pas_of_match[] = {
 	{ .compatible = "qcom,sc8280xp-nsp1-pas", .data = &sc8280xp_nsp1_resource },
 	{ .compatible = "qcom,sdm660-adsp-pas", .data = &adsp_resource_init },
 	{ .compatible = "qcom,sdm660-cdsp-pas", .data = &cdsp_resource_init },
+	{ .compatible = "qcom,sdm670-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-adsp-pas", .data = &sdm845_adsp_resource_init },
 	{ .compatible = "qcom,sdm845-cdsp-pas", .data = &sdm845_cdsp_resource_init },
 	{ .compatible = "qcom,sdm845-slpi-pas", .data = &sdm845_slpi_resource_init },
-- 
2.56.0

