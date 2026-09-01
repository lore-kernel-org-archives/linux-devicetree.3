Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E89488225
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 17:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788283268; cv=none; b=eGgy9xml0OINuF0JzTAnAybnxPdo4kyC+fxLHyLYKKb9C5TAqv76mn/m4OG50eZaxDCf4Q8UDUia96wbVxxPgw0XHKwsTiFFNfnMmS2DghfPkfR6PhB4r0+A9qWxxM5Qh07eYdqQSarQSIyT8E2mJVxRFQFEAuu0+fHpgqJGaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788283268; c=relaxed/simple;
	bh=OQLNFPvUQ42540MPbj4N+mCmoR6LhlUTwjDObKA096Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dk7jdf1sDZ1BI3O6mvuenCDG9mAmzLg/ChJgRTvj2vjYvVMYmvM0W5Ub/jhZt+Kv8OqUCHSmjtIsdbLvfqi+8KSlqqIR1twPDPpQDS/SldcqwzXgjtxxR2VqW45r+sth6OSOcwKVZP0CFF64YQAEYJlkhkEGNb9z8WZgZkVb1/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=AQqjXECo; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="AQqjXECo"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-5301a453186so112291cf.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 10:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1788283266; x=1788888066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F86NIStLY9cGoGB3xcagvq9+EPuFUydagIKpVoDWv1I=;
        b=AQqjXECoDXFW3/SbH/KCJD9TxYC1OO5AmNMq5zXo3mdVQ9mdXpaXhxtIaI1Q58JxCK
         n7KxZ8EfMW8XfMBF3bD0yTJBvO1bWIpbY15T5h2Dqej5JstOTutQa6NMvpDKYNB1DEl0
         YheKK4xFgPirifEckSJtFTaOkKEGvOjLCVvr5FZDG9JZadUeHF+OavvMifOR2sWwGAdJ
         d5UevThE2xpSbIX95PpbgSSfeB2w5soWMxsffj+6oVQM3F87a0M3BrGrRj8dLRQRAwHc
         aptNHszZnD3WOHw0ZYJnyCJFXJJehUQrnUqgCNo67PH5NoCbAGzEywt6Am+S22PrZG6K
         nmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788283266; x=1788888066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F86NIStLY9cGoGB3xcagvq9+EPuFUydagIKpVoDWv1I=;
        b=ADtteRFbiWafqM8oC+vg2BNQ3eFb84SkMmW61IPQjCT6u8VobAUlB9TXHD/ojgmCtw
         Tdk3CIe8Il3K8Kfc8u4znLopRygw2KDTesleVtia3GVKKBbATXgJkFMknp0o5O3IFK1N
         Q7cyeG1JUet7Z+1KN/cT22j9tYKiPYO4+7iC3tao+C4yUmadaqXat8dspfvCHq3NS5qv
         t9QNLatWkwmByi/b8OFykA1g8tJwWl/l+7cJhAo89ol0XEJ8WmPyXbNzyXSzyIpXLsp3
         I8YWJcvBgHJZ98509g5/9jcGxtGdHMF5PfYibmB/1c+S9lwuqEvpFD/PkU2VA2ZNm1ty
         n/zw==
X-Forwarded-Encrypted: i=1; AHgh+RoKULxZ/yFswGixVpKm85PFfR8ej13Gbif/ppxTd40fbcVQDdN4uLL9nO/vJmmrcjqp1rJYM1Kq8TWn@vger.kernel.org
X-Gm-Message-State: AFuF++lROF/ghApr9/AF9Mr9iFtgG6iwpKS3e909DcpH4qTkjQBKFO63
	JgfIwNpIdEeuFqjNtPnL8Vb2m3ZzRjcMn/ewsy5y65B2CrsK/YIpn5yt3in+uQ315q8=
X-Gm-Gg: AR+sD13zvIGF42J+ZCp0NQJsY7fMQ0efbKtlfypm2xdOysxpiu0nbvmpQucdfdl06+9
	7U3VgNyySyajezn3fjzjonCyVaEUVy1wZ3pibMb2TT1/1edQgOIc0eTa2f/Mp4w2422GyIG8rPC
	fXi+Q7DP0458Eu1k7O9nt+v4+IjWPigiGvizS1dQRsrwCL8PTGErjkmn8xf9GzS0KlTpJYWpeqQ
	GUmC+IvulXDSdZSrxyZSN+E1n+rSaNW9SYZGCU++D08dYdNSbvq35pc6rf1Sjf7urPxyw9D2jPf
	1FS7KbvQZFJQg9xI9GEsovlCDSXH2ppSl/fJdOJ2Ep1RRUyQOCptv6JaH2fB1quBe5gl9pUP+Vr
	momaE8VhWszaNo9zSywpn/yxAsy0/7Nqhz0GmoNDdMsifLd7/TVc9JeE4bWzecDLmlcBZ95dp5Y
	/cCQwCqmfdvGpnSgYqknGw6O3JHs44PhufP6OTntkk66/H2wcfIZhoqe/yPFiMre16UdmrGQ8Vq
	tQ=
X-Received: by 2002:a05:622a:58c4:b0:51c:ba4:d837 with SMTP id d75a77b69052e-53021bc32aemr151866041cf.18.1788283265551;
        Tue, 01 Sep 2026 10:21:05 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331d9cbcsm1423661cf.16.2026.09.01.10.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 10:21:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: qcom: lemans-evk-ifp-mezzanine: use pci for device nodes
Date: Tue,  1 Sep 2026 12:20:55 -0500
Message-ID: <20260901172058.1512508-4-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260901172058.1512508-1-elder@riscstar.com>
References: <20260901172058.1512508-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change caused the embedded PCIe endpoints on TC9564 SoCs to
be treated by the devicetree code as PCI buses, which is incorrect.

The Lemans EVK IFP mezzanine has a TC9564 SoC, which includes a
PCIe switch with one upstream port and two downstream (external)
ports, plus a third downstream port.  The third port has an embedded
PCIe endpoint with two functions, each providing access to a 10 Gbps
capable Ethernet interface.

The devicetree nodes representing these functions were previously
named "pci@" but were renamed in the interest of consistency in
commit e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@").

Unfortunately, of_node_is_pcie() causes nodes named "pcie@" to be
treated as PCI bridges, which PCI endpoints are not.  The previous
name "pci" matched such nodes as "default-flags" bus type, defined
in the of_busses[] array.

Rename the PCIe endpoint nodes "pci@" so they are not mistaken for
bridge nodes by the devicetree parsing code.  This restores the
previous behavior, and allows them to be used for PCI endpoint bus.

Fixes: e806c63ba51a7 ("arm64: dts: qcom: Rename pci@ nodes to pcie@")
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
index 6cfa0bc1440e9..22c975628ed79 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
+++ b/arch/arm64/boot/dts/qcom/lemans-evk-ifp-mezzanine.dtso
@@ -271,7 +271,7 @@ pcie@3,0 {
 			ranges;
 			bus-range = <0x5 0xff>;
 
-			pcie@0,0 {
+			pci@0,0 {
 				reg = <0x50000 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
@@ -279,7 +279,7 @@ pcie@0,0 {
 				ranges;
 			};
 
-			pcie@0,1 {
+			pci@0,1 {
 				reg = <0x50100 0x0 0x0 0x0 0x0>;
 				#address-cells = <3>;
 				#size-cells = <2>;
-- 
2.53.0

