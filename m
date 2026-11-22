Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795324391;
	b=CNQdNMgSUe2nYZz70AJlMV9PXePOuGSGiezlhfq9XnzMRnaQE4rR7cV+mXZe+mQOYIOX
	 q26rVSEdXf8rScjlqR+Mq1OlQl4++VToS64CgoyRZ5rsCvWb2s+OGFu/Zz9iW4aAxDR0a
	 /N3PvwFXb+RjiA62jbQdmqhto3nATBUCFO4woO07kOq8FSkbNHQnCFZrHGWz6C50zGk6F
	 Aj+1PbucNmY9+zL+2uVW7x5Xl3QF0zAJTazPDCzh82nYNra/SsGowhYg8lrLRH4Siz0cK
	 6tSb975XVPRxFoq3dnvDZN3F7ebGkaYV8pNp+iNnoCh14T6FIH6S4f3rwRI0DnHJaJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795324391;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LbDS9IpPDex0TvN3no8LP70sHsZV1X+KNwV54iyF28Y=;
	b=w6JUoiza++k8oakpbYpgWALXyvVC+lFSCZJyEqvRTTuublbiGTm68TnO4kN2axcRa2H7
	 tGumOHlo9IEfG/Gd0PgJIVUKT3eh+VuUu7UdLNTLdFC9d7Be4zu56UU+WKolWMEi3rnSG
	 KgVX+uWNYtd67whidp3vG2qG2jaWNDMHROgdRIR8/NDUCp9sgFT3c49OvtMOE9EnGXNQU
	 QnvSjZP5kAT2C40mn3msBgm4G6P5iS8gWp5c1DbpjDWk0VkzeLy6HdJk3pkLnlS5QvvQK
	 BhhFN+N5FKrvb8jBeyCPwLB2tFqJVbxSIKUHCJ9ypE/tgHlbHSQGtDnawFxch3rpBsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1ji8abm;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906B2606A320;
	Sun, 22 Nov 2026 05:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H1ji8abm
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795324391;
	b=ssIYXaeQHbusE+b24miVo468CUN5OXyzB/mCHm0EinmI2LRkT8ob2f2eB4VuEyXs+ErM
	 0R5GNOOUb7OKZal38taOsKkgOSwEPtFUbrn2hNZpjIkr2j6re//MOp/TTaKMwpJaXSyu8
	 IWF/eQs1Zd5+kybZ5UOBFXV72ejEhxy1D9TPHzo2ySIoHrr1e2soJ8LpdHeVTAEV1Siwi
	 jB06Or8ngmOJRBvR93Q8yYgIhwnK8cUk/bb1E1gDgxayVhtLG0XcjcYizRAJ+4derpapz
	 TG+RRbHIMB1XujNc+dLl0jQdTltekksRb5Ny00wFfF6QQNOor43H24kJiNnv9Cav+jQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795324391;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=LbDS9IpPDex0TvN3no8LP70sHsZV1X+KNwV54iyF28Y=;
	b=vguuNmERrGsdsaGd2nGxjs+mNWYAwrZvnIidJp5OCfA3tDVufQ9pWLXVCv4uap5UcNnx
	 xF0RdSsqb754FZ49GurF7tQzrbiYWdSUFy2xClatdxMvQi5xM8W9blIilhkcMvXf5JAaz
	 oL2dAlX/0HeAbcnNYobeMYv++Wx+muN0FW0MclboAvvKZOMbG3JOdypnboqBdhnBiOVoj
	 7uVbOJLf4pD8CsnFKignYxYVqTq9wnIYpBNdAULI0B1FcK7ezQNDiFMIxuHFQ1lIdG/39
	 GMEW70AxbRWpkemjk6KcU94RBT8xhS66pinkJQsgMuBw26SIbiquMuAvBU2EHkjDXUQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93E601F000CF;
	Sun, 22 Nov 2026 05:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795324391;
	bh=LbDS9IpPDex0TvN3no8LP70sHsZV1X+KNwV54iyF28Y=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=H1ji8abm6wwp4PxYUSXc7FvlwA1qyfkFGNZZDHzRbYcFxScuk9BzR+W4c5CHxvD5S
	 Hm3UH6PJegl+Ek17vZyMeHyjFnf5l5oTrl1DiMTxHWzolFaWLT5xS5uXkg9Rqt7MT1
	 mzOE8PctUXGwhJbAOB9wZu9VjCIv/xRdLi+3NELZAQRt1uCGFnJTEajuKDDxG4R3LL
	 /dWITcP1I0s9orBurPJuDJkp1GDL5K893x/sGsPu45hADaHXL/tgX36hDrMJS9J5m+
	 lxpp1tMdj2RGFVgIfBb5MrHS4OJi1cN5FoU8sXnXE9Y64kn9m6FD6iaf+gDMQrfxyE
	 jxJIhYF2T8PRw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 24B2B4BF2E;
	Sun, 22 Nov 2026 05:13:10 +0000 (UTC)
From: EMCP333 via B4 Relay <devnull+emcp.enser.io@kernel.org>
Date: Sun, 22 Nov 2026 05:13:07 +0000
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus-fajita: Route the
 microphones to MCLK
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
Message-Id: <20261122-b4-fajita-codec-mclk-v1-1-ee4bca21d8ba@enser.io>
X-B4-Tracking: v=1; b=H4sIAOJ5AmsC/yXMwQ6CMBAE0F8he3aV1orRXzEetstWFrWYFokJ4
 d+lenyTmZkhS1LJcK5mSDJp1iGuMJsKuKN4E9R2NdjaNsZYi95hoF5HQh5aYXzy445mbwK5kw9
 NfYB1+koS9PO7vVz/zm/fC4/lqzQ8ZUGfKHJXosLddNw6TGxhWb5cZyAomAAAAA==
X-Change-ID: 20261122-b4-fajita-codec-mclk-131fa49bf605
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Dylan Van Assche <me@dylanvanassche.be>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 EMCP333 <emcp@enser.io>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795324388; l=2514;
 i=emcp@enser.io; s=ultron; h=from:subject:message-id;
 bh=DGyS7iiSyD0F0W5165hIjMOEexnA6ODF4zyy8Qhxe84=;
 b=MPSGHzz05h1QrnlkAVXZ9JRXshJXFKZpSpb6sX3os1zzdzqFHl1RSXes0z96fFYozLT4XnMsl
 BEs3Zsx4KpLA2HsUkADPwgt7hB2Zvcor24BKNgGVeghlUjx9UfbIszz
X-Developer-Key: i=emcp@enser.io; a=ed25519;
 pk=5sG48Lul+Vn7OzXu3VZrCWk5uvEFPYMXYnAV0TZR/tY=
X-Endpoint-Received: by B4 Relay for emcp@enser.io/ultron with auth_id=1598
X-Original-From: EMCP333 <emcp@enser.io>
Reply-To: emcp@enser.io
Content-Transfer-Encoding: 7bit

From: EMCP333 <emcp@enser.io>

The WCD934x system clock is a DAPM supply widget, "MCLK", and the codec
driver routes nothing into it, so each board has to. fajita connects it
only to RX_BIAS, which only the playback paths use. A capture-only
stream therefore powers the microphone input, ADC, decimator and SLIMbus
TX path, but not the clock they run from, and records digital silence
until something has started playback.

Route each analog microphone input to MCLK, as other WCD934x boards do
for their microphones (sdm845-samsung-starqltechn,
sdm850-huawei-matebook-e-2019).

Tested on a OnePlus 6T with this change on the postmarketOS sdm845
kernel (6.18). With no playback stream open, a recording from the
bottom microphone powers MCLK while RX_BIAS stays off, and captures real
signal (peak 22307 over 6 s). Without it, the same recording is
constant zero. On v7.4-rc2, dtbs_check gives the same output before and
after.

The OnePlus 6 (enchilada) has the same routing and probably the same
problem. It is left alone here because I cannot test it.

The code and this changelog were prepared with the help of an AI coding
assistant. The submitter has reviewed both and takes responsibility for
them.

Fixes: b7b734286856 ("arm64: dts: qcom: sdm845-oneplus-*: add audio devices")
Signed-off-by: EMCP333 <emcp@enser.io>
---
Also ran on v7.4-rc3 on the same phone, as this exact commit: with no
playback open, DAPM MCLK is On and RX_BIAS Off, and the bottom mic
records (956 distinct sample values, peak 654, in a quiet room; the
failure is a constant zero).
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index e9d1a1c6ac..a03c1ea8fe 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -51,10 +51,15 @@ &sound {
 	model = "OnePlus 6T";
 	audio-routing = "RX_BIAS", "MCLK",
 			"AMIC1", "MIC BIAS3",
+			"AMIC1", "MCLK",
 			"AMIC2", "MIC BIAS2",
+			"AMIC2", "MCLK",
 			"AMIC3", "MIC BIAS4",
+			"AMIC3", "MCLK",
 			"AMIC4", "MIC BIAS1",
-			"AMIC5", "MIC BIAS3";
+			"AMIC4", "MCLK",
+			"AMIC5", "MIC BIAS3",
+			"AMIC5", "MCLK";
 };
 
 &pmi8998_charger {

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261122-b4-fajita-codec-mclk-131fa49bf605

Best regards,
--  
EMCP333 <emcp@enser.io>


