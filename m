Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795557110;
	b=YTA/sQlEUF2kuzv5KSqB/cb73c13MU7lmuPQMZMJAJ4xijT/BJSkNBArJ8zFx4bzBYZP
	 H+lPmKlZDG+w8+t+kNiAOS8NZwXdxTF9m1Yhvjkzit1IERya1LMPVnBhuTQnf2tx5YCym
	 4V+BXoFywYziXiorKKiypeEsB9Up0mF32M81ONhGHvHzZQ+sjZY3RToQj30/WkduTIpsU
	 +xAKdKWrQSm04XAbu5zQ0XamRkqGz3upo9riK0LqWgm9Od94V6I1Dhm6v6aLhAJIt8yqC
	 bEzhvNTrB9UQZRf15OcREL6IUObwsCognb4o2k6plhggv0zBT2WKHdu37EEFiYxbX+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795557110;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tBKQzB+z4+QnWb3LLc/EgXm4e6h4b0wS2AMJFav0mKE=;
	b=kpuTwN2XsZY7Fy5+5opmPsz4QCbRGkQgn36YtiH+qEs98x137qbJf9VtJZ53CXwjXyjf
	 xWMNJVkT/9lhH0QgXk+boekhrx7DCrlvAoWZ88YnWtnrXmB8CED8hIOPAgzrbrgDlWJj/
	 u6epx+X9RrPlqVg+8G6P04A3qj3JC54v0j0zYWN9akXQmdcC7C1vxUK5BOjwl2CAvj3wO
	 52qbejzwJL8nv8HF3Aw/qSM2/WNaJySl0d5IwOFod7EmhRqWvXXSE0bi+/7wN11aA8uLE
	 ahpgFCxdAo0ThRa5VdYGTpl1rDXuKsCtdd5+XM4sQ7t5ea1ruJYdLgFLaVkwwhEET3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="PS/0myul";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DE606A697;
	Tue, 24 Nov 2026 21:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PS/0myul
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795557109;
	b=xP/rREDzYs9kntyPSCZvJxKuIXAXD0JWuKDOUt0pyIByH7rqyUIS+ge8CLNNxBkKaa6f
	 9mN4i9eBveJ/vXsbQLIwO+eo7D+NKyHv26UynMzdNm0ZekXc6gKWrXRT2Zmn60ucOD3fc
	 lv37W5475Pim/cKtQIp9AyrZq6OUayFz0VwBFtw4wlfOME1hxf3ta02Kg8gEHT2R7pGmT
	 0/XRVR9Uvkus5M8Mgi84kZE3Z5t7Ld8rE6uYwlGR2wrGCy0YRm1eNV77DYLf9OvXsNgFq
	 cZPWmDacTCzwUlxVfyReMx4ZjkqJgi1rY0ZHHLvk/VHsmrg3EC7CW7dPH8jD/DTCOKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795557109;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=tBKQzB+z4+QnWb3LLc/EgXm4e6h4b0wS2AMJFav0mKE=;
	b=zNSCLNo1h128kRAM2+dXiw3BqOy5SZh1AylB4IlgY4mNoSM8fSva6nBuk2PdSPO6KLvC
	 ZO/4P7i2knAIR5fc5rli8TJo7jcmOuub9tLwcVNjQ8FeHZMh9chbPsdMxzVd9VzFxyTh9
	 9hoW30U4WczZ9+H9VmWeDDBmEy5BP3bRa89L8uS1lGBixXLGS949DCQT3TcxysZ01C1m+
	 92pQ7t5N5JvwVtdZ6UReKF16dQwFYxBd+0GsDxhfvp4A4zONJJbHqlss0PkKmFEFNPpzz
	 YJMsQ3Dz75sZ13rju2Xg9mCyNjHJswLHQW5+kqbPKwFZVrPaJ0N3I3FKoTVqZM2W/gQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id CDD0C1F000CA;
	Tue, 24 Nov 2026 21:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795557109;
	bh=tBKQzB+z4+QnWb3LLc/EgXm4e6h4b0wS2AMJFav0mKE=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PS/0myulyLguQjcwseh1djR2xBDE4cr4nTXiB2vmhlugJsqz89IWsj3PLV3zT92Td
	 VstuZC1xRRf7ElDqxxSsTCfdbVyRDSDOT+r1mDUE87NutUMjVXTVVj91Fu1nG5g+/B
	 lK+6WFud0sfAjK4M6pF7hPebnEA8IsvNUD4fCPDHDXe+jMgw0hhlosOynef4ot3hd7
	 84r0IolDooUR9Dllbgd08ThSccFqYC/pcsBn/JzG/j5Ov4fnXwUQ42CsBEqtRenPoW
	 QAjyoRMsVd2u06rHdoLYeC1BWRM7MW0OlBDng8l5fh2v5uTN16MI1wAcP/j6nysDYH
	 ILe/1J4t1J9RQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2FDE14CBB5;
	Tue, 24 Nov 2026 21:51:39 +0000 (UTC)
From: Marko Zidaric via B4 Relay <devnull+darkobas.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 22:51:11 +0100
Subject: [PATCH] arm64: dts: qcom: glymur-lenovo-yoga-slim7x: Enable
 SMB2370_2
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
Message-Id: <20261124-yoga-slim7x-smb2370-v1-1-2656ec0226e7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAM4GBmsC/yXMTQ6CMBBA4auQWTtJW5CKVzEsShlgDH/pCIEQ7
 k7V5bd47wChwCTwTA4ItLLwNEboWwK+c2NLyHU0GGVyrU2G+9Q6lJ4Hu6EMlUmtQu9qm94fhcq
 dhljOgRreftdX+bcs1Zv857uC87wAFoP3JHcAAAA=
X-Change-ID: 20261124-yoga-slim7x-smb2370-cad7358906a1
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Marko Zidaric <darkobas@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=darkobas@gmail.com;
 h=from:subject:message-id;
 bh=PTLVAGVNPZeF9esS9Acb6R6hiwos8Jxkhf5ea1o2p+4=;
 b=owGbwMvMwMGYxdFjFCjQw8R4Wi2JIZuN7dWEV9GreKrVaxiz9ULVUrwudAWmh2761+bvKDn9b
 nrXpoRORn8WBkYOBksxRRa9w2tSrfhZA5uuRUyCGcTKBDJFWqSBAQhYGPhyE/NKjXSM9Ey1DfUM
 gQwdIwYuTgGY6mOq7H/4HvyNtTpgd3hvPrNz5d9HHku2sgm1vdv2Tz7BRTmH8azTl3nz7vno9K9
 UfDf/uCbfk6+Bk/udN/zRXCzF6ndL+kW4idlh97KDuvNkandl9BYYepXuc63Pn7n402d1S0k3Bp
 GvcaLFNxed9/3FvzqwWXLBpxdla4/0Xig88PjJwqmpbh4doqUHVla9M0tV2TDVfmeG5YOFCUoTJ
 Z6fnjLjxo70BLkDmnpJZqFZW/IX9wpc1VVQW3zEPEtI4iHvbZvyOWq6rn0XQwWkr2yUS7SSNRYO
 KVXVKgjY9m6y+eMvpZ73N3xTemDyYIbHWknFJGP+QHun44muhecmHWk+uXm1DKOvx4vc0GdiVx4
 L+gAA
X-Developer-Key: i=darkobas@gmail.com; a=openpgp;
 fpr=2EC3AC653A0F055182D658926A088C3251108C02
X-Endpoint-Received: by B4 Relay for darkobas@gmail.com/default with
 auth_id=1633
X-Original-From: Marko Zidaric <darkobas@gmail.com>
Reply-To: darkobas@gmail.com
Content-Transfer-Encoding: 7bit

From: Marko Zidaric <darkobas@gmail.com>

The eUSB2 repeater of the third Type-C port sits on SMB2370_2, which is
disabled by default. The board file only set status on the repeater
child node, so usb_2 never probes.

Enable the PMIC node instead.

Fixes: a741ecde8949 ("arm64: dts: qcom: glymur: Add Lenovo Yoga Slim 7x Gen11")
Signed-off-by: Marko Zidaric <darkobas@gmail.com>
---
Tested on a Yoga Slim 7x Gen11 (83QR) on 7.4-rc3 only, by applying the
equivalent change to the DTB; the affected lines are unchanged in
current mainline.
---
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c9..c6012e162 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -870,11 +870,13 @@ &smb2370_k_e2_eusb2_repeater {
 	vdd3-supply = <&vreg_l7b_e0>;
 };
 
+&smb2370_l_e2 {
+	status = "okay";
+};
+
 &smb2370_l_e2_eusb2_repeater {
 	vdd18-supply = <&vreg_l15b_e0>;
 	vdd3-supply = <&vreg_l7b_e0>;
-
-	status = "okay";
 };
 
 &swr0 {

---
base-commit: 8d7fe9885c62fc9a95bf55d9db244d9672a8aadc
change-id: 20261124-yoga-slim7x-smb2370-cad7358906a1

Best regards,
--  
Marko Zidaric <darkobas@gmail.com>


