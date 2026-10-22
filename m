Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668980;
	b=VgVqHLSmbE09pWG6D+2nBtLaRaa8LYcGUrlAOeumK4TqSQ+u2sJ+tMUS0zL1gwtkEMst
	 XW2WjcipX5r0L4QfMwRZdnM7B3l1CiytvpqyBpT3CojccuSOPnI+BvBKTP6rytknlzXku
	 TCCMUBw9neNTQEmm8PlJuWZ1ULLEq0wlSxyj3ew6SrT9CZySR1ZsY83Nl1c0wJmGuP4cb
	 LsXGRKVs7U1VG05IS3Ls+GT72iLqTo3+Ql8A9Q9kGygvsqp7wjgprDEy1TA3WX6Gzu0Cg
	 N7Z6cQ7Q9H2OJfpGeXU3YWLBVilCZCX9MATPQC35Pz5xYNyGU3skgDd0WG875/nXIkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668980;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=bfuoG+nZyeQYfwICqr8wZaR3SV5xzcqhy5qUYyq70HI=;
	b=UD9UyEX2xVFPY2VQQ6tUPV6JUgyd235I4AcqDzz/Nn1cKM8545vzfqxwFor7WRzzQfGz
	 6kqgjAlpVPnBATkGY+Ae0DDIvoDaukhEpafXwi/KsX54eZC5b4TZu4qqMbjSx/IDLbn3U
	 v+BTWm4Wq7TkkYFWapD+/g3xoZDR9Nw6Kh+ofFCyCLDfygHGrl50RjXp6idrqSZPMi/Xc
	 Jp+HjHB2W3/trax3RVgi+R8jlwiB1a92YYcqVP8k7TdmHx3zYtpn0PkfjjqDqPdzOOu+F
	 Q/DzOBNrk3dtPfwoA/EUCqUncqNbuBUHzAMpsMBKvzsWDbb56OPGhZykX7WaHDsTVFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZnTPfHJ4;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E9606A31D
	for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 11:36:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A3E9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZnTPfHJ4
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd3310348d2so314924a12.1
        for <devicetree@vger.kernel.org>; Thu, 22 Oct 2026 04:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668979; x=1793273779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bfuoG+nZyeQYfwICqr8wZaR3SV5xzcqhy5qUYyq70HI=;
        b=ZnTPfHJ40xy3kmxyUvyr2B0ZqNZtmfGJrSVXAcGIcs5nDXm4SvPiLkuO9W8gUzr/Vs
         b1Of1qQ13YN2iRXvvu6r4aFaF+G/ocaYW/TT/Z3p4dSAGm0rJLESCCm/hfrZU+YHxNih
         qH24JhIfdKbjYC/XHZVx5hAcmdjkEKlBXy2RpjkRq4MJiIAguaz+/pdsGdjk3dszQH76
         gSLIRfaUA3qCSglB/zqfW+xaqph5ycvxKFlRniJnRkA4f9F5q9LOgwwdRiRBrQ3u1i8d
         kdMQv9FHkkLXtCT/C3AkbgmDNhZr+fj8lMMSg/2GYbKUL1vQ7Biy/VZrptXnzQGp8DPs
         mpRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668979; x=1793273779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bfuoG+nZyeQYfwICqr8wZaR3SV5xzcqhy5qUYyq70HI=;
        b=eRghv6QtgIv9KLCiH4YN487s3sw7BS5fkHn/kHaT/O3TLj0DTilmRuxt0FzJX2e49o
         2zEd5/n+l6Zg4iBe+a1vbSOcBEmAyciOOuLKKYsxWkh9P4halhatehdgCFM36L1yYGpI
         wovqcl4RH3rWRsRm2oh98SVr+GW9pGObkDuu5Rn1f/SO1sxfTHXunPrWczrNQEpc/dr5
         8pAX+WW6rTQvA/8jl8lVhcX78FHRmB599+NxtOXpHaiDnWGV2KB0FzulBgM/8wwsbGSu
         KnwaT2MIW98AT25isoKsLx+oruv/kutFvEgYSom/ugdTbxvv6rD3dOE+xeT3COdLf69S
         XDRQ==
X-Forwarded-Encrypted: i=1; AKwUvByE5LXW+KCNx+ABshSXVhkfL6hJRMTPAEh+QrHoNl1fCFdBDZaxYniTFe4bkpmexa/kQYSwXaLi2WFI@vger.kernel.org
X-Gm-Message-State: AFq9FYLDqg1Di+tQ1tH+HvH2o6hms3qw3MA1AcTBKQ0up6slWoT5JOSV
	S0diR9ZhRSRjGcev4G5VM6DzPa5REl3EkpYs8ZTYDpUqC3KjPBHstpkR
X-Gm-Gg: AYBFou1hGvkdKTDJXDnCKoNqVpNQE3dTUd9F2nVJHjgCEGR9jNfDuTPNMZMiOVx9XfU
	nr+vfGW4JdB6pTv5VxZ/r9LV5YejaNlVJoDUA5YkDH1strmHxYy0PTPVEb2UnHgBCt1Z3NmwIp2
	FruZrxAiFk3CLK1wc+cHM8gYovdwF7v8xWtaE/uqvvPcnE4bn5B2fnbM+Y13lXy40a4n3139N8v
	vVAOyhDvpU3OxSbXQNspXxzFuF3AZo+jGRneDgdoiWsgkDelymm4MB0eBqzNY9HLF6y2OBUB9+O
	V9ub7wb37OTr0PHC7Ql3535pcU+m91bevKrTyz9dKCfDVow/qzp8MtaZMifPRAq2+KLrpSmC+By
	88nRfw58+3eps99SQ7X4MMOU51J5rTa1ulFIzj2JwoMJu3YixqFkqM/QArb8sSd0HyqVlvQMfwA
	ns0rmBzLQ+d6Ao9+tXrZTVCVcuVLDEkoZenia8CXnJgaXaWY1tz467rM4uUsruURZ4jvjFsQSdh
	DPqjujlBdSxu1BvuDoM7Hof9bmoQWPRa/OeM4eNut7DQu4BpcgV+3+Envj51YgOVDudHLyWHDIx
	hQCscmI+Q/r6EC9R/6A=
X-Received: by 2002:a17:90b:268c:b0:3ac:860e:1af9 with SMTP id 98e67ed59e1d1-3ada6cb5e87mr1241992a91.41.1792668978969;
        Thu, 22 Oct 2026 04:36:18 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:18 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 4/6] arm64: dts: qcom: sm8250-hdk: Enable the PCIe ports
Date: Thu, 22 Oct 2026 19:35:59 +0800
Message-ID: <20261022113601.2320940-4-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: redstonee <1516235445@qq.com>

Enable the 2 PCIe ports on sm8250-hdk. The pcie0 is for the on-board
ath11k WiFi; the pcie2 is for the M.2 connector.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 9ff15d9d7..77273b6c2 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -712,3 +712,24 @@ pm8150b_typec_sbu_out: endpoint {
 &usb_1_qmpphy_dp_in {
 	remote-endpoint = <&mdss_dp_out>;
 };
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
+
+&pcie2 {
+	status = "okay";
+	vddpe-3v3-supply = <&vreg_3p3>;
+};
+
+&pcie2_phy {
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+};
-- 
2.47.3

