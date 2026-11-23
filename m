Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795467256;
	b=uYOcTd8aXIRNcpe4hFkJP32PadbIShntRxqHTivrS7v2tK7ddCGsj8UEXPlGz6OSNl2B
	 CRLdLSS2gc7fO4mtzzxMkNAkS6Qd2M0iXs60wp3YkuCma/pmQm4nQS0cUCSMvNKKnVkRA
	 mn2EQe+h3NgozrM58vLyxAfpIKMaEFerbRAKn3TpILoKE7pOFcBRLR1+iD9kKgI9j/2XV
	 zGbLHi4bxAGMEU6gtHcOQzy2OwnHBpFhhKm3BPduOjzBexRPwFt9TnHevn06e8Q4wTO0T
	 XdfyQTmCPX54FCP58HbPQTL71tQarznm18UT4RXDk0Arv0FUV+/y4eDNWjkcejI/C3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467256;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gSJCBCLnxHeJ75ccVtGN789ctKkAr6SO8Z8c5EVxU9w=;
	b=W6hhNlTOUB9DIGSsnveE7IGGb/jUe2nwXv4VpObwrH1FQaiZcnQDUz2DZ83ocGxnIjn1
	 F3x08m2g0QHdhiRTGG1JxH/TjVgCRpGKjDTV/ex80OI5VB5hL+mESiRB+9jHfOO5SaLtn
	 uUdryg7ZvvgQVlWu5k0OQv2gNdXoxAcbstLf/r41d750kpsbg9yGRRRYR/Jh4Lh+BED8/
	 beHDohp1rk0byuWtLkBVYe+Woi5M5ZKRI+kvoj0psW/+NgctijYGy4DOhLqlJZcGwi4ke
	 jPt0h/smPGPSd8iFPD7qOkggOv4hHWGg7DiieP/ZJaP2OjFv+rk9zsWoZOCqdp3HujQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+L0acfG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14185606A321;
	Mon, 23 Nov 2026 20:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i+L0acfG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467255;
	b=co+AZ4U4TgOkOAoJikeprMyXxOJqdTq5Tv/q8T8whM2XuMTGq2SLAd1oAfvCkjiU7v00
	 kFUk2oepOR8gZ46WC26sAHevUxeynxV44OzThkB/YHuOE6GdwXNsvZlZSJw0anV1oocY1
	 7w9B6PvqI+7fD5CX6htjB1Zc+piqyljHxRAhR04cxG0yuan8GyHN8adOlqUShdGxkdTdE
	 MIZ2fPD0kMRyf8EZpFJHlWvFsOlCpAPOfpVXeUbki29U9iccPFCl8T5jGt1KkwW3/o4ij
	 pH/ncpbsuvS/lgJeZ5anXq2KPK9C7ZwzAC2XUiyggvIdw2g1LlB07GR7wL5UggieF9g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467255;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gSJCBCLnxHeJ75ccVtGN789ctKkAr6SO8Z8c5EVxU9w=;
	b=uKQknbmAFivG4I7KB162w9BRUdqLWhwaXLHIHHRNpt/uTmZFBC8msMFfLOWXDcFni5nO
	 LGKiMaNBhYR/a6prpSIC7JZhV99RsIfo4xGycaIeNJVTWp79cTmbShYWNdZM9HSYMie0g
	 7oKCScMmT3kpt56I1xojeCLuYuOcBfEw5aLi/1YG0YKNA3Qtp0liC8GtkKWYxo3m9ik4y
	 jkludZMHIA+smu36ddo+3wuTwJiXQZY78RG4hyrZc0khXSc+bNaipOOI4a1DLT9tX3knq
	 StaHAbQgoS8Ug9C/HFKtrPwY+MsXjGqh7kvIlf4WqIPEfDvc7kBjkd1sHL7AAPzDvBw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E99191F000CF;
	Mon, 23 Nov 2026 20:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467255;
	bh=gSJCBCLnxHeJ75ccVtGN789ctKkAr6SO8Z8c5EVxU9w=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=i+L0acfGGMyfiyesw9NGEn0zQ7m9p3qSJ3Xn3W0ZBGVbwKFRmjf3AlHLznYCWDa0K
	 u4ZRFPYX1kZ7Pxz4JL5Ize6Ss9hAJj2K5rCimn7lmELI9lY7h2QLN+n3DgZnAW3yp/
	 tRkDCjb7vRcdli0bd+Fc6OqV6vcmQLj00v9rfHaD4n5Y44C+6CXw3pqcWVjBk/3NM7
	 DDr/Ns+aK2fqZvEGZaJDHdnnAiDMBbo7AH+tmbgU78R5lvskUj0mE8/LI3oIlg/0G9
	 VihIcqVmsoXbUuPtQpa7/K9ndB5cDUXX91ObPtqDEy0HkhjugCPvCgsKqiqGzeVq5+
	 NIKcT1yv3nRiw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7E2304C72D;
	Mon, 23 Nov 2026 20:54:03 +0000 (UTC)
From: Stoicoci Mihaita via B4 Relay <devnull+stoicoci.mihaita.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 22:54:03 +0200
Subject: [PATCH] arm64: dts: qcom: sm8250: Make the ADSP fastrpc remote
 heap no-map
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
Message-Id: <20261123-sm8250-fastrpc-remote-heap-no-map-v1-1-68ce6470e82c@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOqnBGsC/yXNywrCMBCF4Vcps3YgifYSX0VcpHFqI+TCTBSh9
 N2Nujp8m/9sIMSBBM7dBkyvICGnBn3owK8u3QnDrRmMMoPW5ogSJ9MrXJxULh6ZYq6EK7mCKWN
 so/tB2Xk62XG00DqFaQnv38fl+rc85wf5+g3Dvn8A3JS6OoUAAAA=
X-Change-ID: 20261123-sm8250-fastrpc-remote-heap-no-map-15609b849779
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467242; l=2085;
 i=stoicoci.mihaita@gmail.com; s=20261123; h=from:subject:message-id;
 bh=VgzMi36Z50siaVxASdbNIrQSmm9qWWzg4SVyaAuqVHI=;
 b=6ctYusPoF2jBunbjDfr+/dJviQ2SO/k2DaeqdPTPcV16l9vtYBClJWpOIOyuWQxSI4QPOnb5Y
 y9SZG+LbUOSBYCMhECL8HBurSLymKNTOpo0U03H6E8alrM7ZtbEEVR5
X-Developer-Key: i=stoicoci.mihaita@gmail.com; a=ed25519;
 pk=IZ3PTCsOlRAC9RPQEB2Kk12DHzDz+pP3FWH8V6OqGto=
X-Endpoint-Received: by B4 Relay for stoicoci.mihaita@gmail.com/20261123
 with auth_id=1623
X-Original-From: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
Reply-To: stoicoci.mihaita@gmail.com
Content-Transfer-Encoding: 7bit

From: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>

The ADSP fastrpc node hands the whole adsp-rpc-remote-heap region to the
DSP when it probes: fastrpc_rpmsg_probe() calls qcom_scm_assign_mem()
with the qcom,vmids list (LPASS and ADSP_HEAP), which does not include
HLOS.

The region is declared reusable, so it is a CMA area and its pages are
still lent to movable allocations (page cache, anonymous memory). Under
memory pressure the kernel then touches pages that the hypervisor no
longer maps for HLOS. On a Lenovo Tab P12 Pro (TB-Q706F, SM8250) this
reset the device within a few minutes of heavy use (browser video,
Flatpak installs). Nothing reached the kernel log or pstore, the PMIC
reported a PS_HOLD reset, and the TZ diagnostic area showed a fatal SGI
on a different CPU each time just before the reset.

Mark the region no-map so it is never handed to the page allocator. With
this change the same workload ran with the CMA area fully used and no
reset.

Fixes: 531ce288b6dd ("arm64: dts: qcom: sm8250: Add memory-region for audio PD")
Signed-off-by: Stoicoci Mihaita <stoicoci.mihaita@gmail.com>
---
The same reusable remote heap without an HLOS VMID was added for other
SoCs as well (glymur, agatti, talos, kodiak, sm8750). I can only test
SM8250, so this patch changes sm8250.dtsi only.
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index f975c2183..f415da478 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -867,7 +867,7 @@ cdsp_secure_heap: memory@8bf00000 {
 		adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			compatible = "shared-dma-pool";
 			alloc-ranges = <0x0 0x80000000 0x0 0x80000000>;
-			reusable;
+			no-map;
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};

---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261123-sm8250-fastrpc-remote-heap-no-map-15609b849779

Best regards,
--  
Stoicoci Mihaita <stoicoci.mihaita@gmail.com>


