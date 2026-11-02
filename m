Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793656295;
	b=DOGYM2/+sdXG8RHK1UBrDDbvyzCmW+7XNov+dAf4l03T76dyjzPbDJQu+GGiOsZ70Vv+
	 Tycs0hxEN+OtTh5224NkOVTpahBoNiqOtobggpoB5uv3h8WzKxl+pW4wLmwDFkP6nBisp
	 CgPqF6e4c9IaraCjhQPIMOrHTqDIM0uQ3E1cJi3vSnarLkzLrz1V7Z0m2fipWKLCi5wNm
	 H4rgIiil+gM6MxVlHS5UMMxxUy0QdMS9FPwjyZ9Sc+/pYPTElsKcwy76107c6GA/KO0EC
	 GMVyYWli59dbbE0O+OA+dxt3vDP+TwUAnYmGgzeXJiqU41cYAPIU0a91Yh3lMXW6MWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
	b=C76soX2u5OAjWUPHrrmOzVocQAOPHNDOPoj1rXby9tu1h4Gdz4hHzVu3A8pmZt/ioVR+
	 wlNuBUv06ZzF7/wicf1LH+oaEaPCLIKHjKfnzC90p13c4aWwwmlytJ7dng0SUilj0qScP
	 ORzgpNlJfSW2HQ5bWSlhFb4Wh9r4AaFRrNXNPWWDBJ0QqHqbtGKc15UnOXTuPAlcwBr1U
	 owneU6NdXR15D9uVyeewWW1KAkND4+2whPK1TAV75outzlkiaaUtFe05HVQ0ZH1DxmDz4
	 bvRQOS3JUMKzSWB73LO2FbHHL1Lf52dH+MLLfAnmlLlicEY/QeXRQYCrjv4ImAyUPpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EEB606D80E
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 21:51:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32EEB606D80E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNTSo+Ar
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso6008049eec.0
        for <devicetree@vger.kernel.org>; Mon, 02 Nov 2026 13:51:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793656294; x=1794261094; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=dNTSo+ArHEY1p8y6b1Gl1CtTGFOW2OPldm8D157toJld7B0aLlPSHWAsnx771XKWWv
         +acgqY+siIoIZGU5HoMCJ+UxlcZ0Y9XJLQh9Ed1A1camRF1+gKook+dsdrXZpjT9BRpM
         v62LnC8uAIBlkJ7zCyQVHZUfsepAmSfeuuhCG/p6sHcJyBDWCNi9biiNteKhCP4UQmj3
         L/96MDWkO8t2uQjrLSjd8EnrCbd7XfVWWqvzVO2vnnE6HwU3mv5kb+Ur8wxDDXbiO5Ja
         6dOp55l8ef5KzbOYHo6IftBbkj6JfE/Yv7LIW2wPg8vxOB9IRaY1mNFy8/wevuonr9kK
         vJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793656294; x=1794261094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7jSwJK/207WO58UQjI6Ts9YDU9KElEsJfJqCrITWK3Y=;
        b=ozZfymF3Guu3mjKQZucsiJAzEHiO2o4XacvgIcEgcZlWqeyGUx93wV3NNXCXLYU15r
         P1H6oYZ1rihPZ98Bl8NvJ6CUUz/IZyuXU+3/NSZZPzQ8JQf91flnepsrCn4nAwtp25pH
         3uf16CjpHgZ3xKzv7KGp8Y3kAorCw18icLQjeiju2ln6tvT2Mfx5w5UHBgld+Qv7Anbu
         pEeywa5XAs7gKxc4kJ1W2qMJrWDJ6twxMkPuALHbQ9gBBTAEIz+UNolrU/j2CDVuYhUP
         7NNPF1ptN4SmuScqPUk0z3NB6WsN1Mht2B3ikxX0ShV+Fa/n0lKyU+t3QaWjHZE+N+tJ
         g9ww==
X-Forwarded-Encrypted: i=1; AKwUvBy5MTYN9V1EVSFMbBej4N7w5QIN+tDub5Y+l4CGEXR0OZ7zxnJ86m3ejbzNtnJCwKeZgRFaQGDxidMj@vger.kernel.org
X-Gm-Message-State: APuU4Z84BdG/C3rnT4OP9MYeuqX8FCo3+ozaQMRhMjYxJRWCS+E5mvib
	EfjgbWq/1sfrf3+DOofZZB6gEPyhoM3nltWNOfj6dR6R5dlPvxFG4GjO
X-Gm-Gg: AYBFou1TrF9YVImDPeXH+8rlB+g2NRA3muHZba9TfmjxNNaHVMnL4H0VzxdhpoWOFka
	9efGYJ5QxDQBxzM302/lZptMZbexpDAsNj8QkLxJv+e2OpNV874N7Uq2Ae3WxteOxWFd7lUK9P/
	k9FB8FnWFPIawj3BW95xGOMf4kiytSZFmX/O53nanu1aPUniHGunXo2mcbxjwxFGe8su4kpbG9n
	dXjqLtgv6g0hRlzvy+RkavmEWqYHYM6+8yB2Col//Pdx2xd96bGWuL415VISmYTd0UWrheCpIz0
	W3Bu6rxKC0vT/nUIdESHbCFQbkLR0+ISa0Tm9j9Yt0lwuRfF3o2kkltDCNqERwC/cQ9ahHg/uLe
	aszhMI+qEJ0Vaj47Mu7vhZ+1GLqJiJi1O0ucZ/x9erSIqsM5+jcqrc1QPZu7P29VTQgagWeyOjM
	HZixkDin2W0dDs+OIcsKWDJkUmq4faCPfFdWrSMNof/TBx3GTQmMzTrdXe2+kuN/+B0IWxhs7hD
	Riw6l4ZSTolNhsdwex+ZYtD3sQQlzwE2GlozyNVT9h0nYKNXTtAtdh0ll5kwGgx2jshpnxEGKqq
	hfCJjFB476aA5C6ePICbo6HHg66gpdqUdVme108q/kdf
X-Received: by 2002:a05:693c:88d6:20b0:35f:8c5d:5928 with SMTP id 5a478bee46e88-36a4244db5emr16226283eec.30.1793656294172;
        Mon, 02 Nov 2026 13:51:34 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42935b4asm54710712eec.16.2026.11.02.13.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:51:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: gregkh@linuxfoundation.org,
	Thinh.Nguyen@synopsys.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] arm64: dts: qcom: kaanapali: Mark the USB controller as a Type-C mode switch
Date: Tue,  3 Nov 2026 06:51:20 +0900
Message-ID: <20261102215121.738-4-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261102215121.738-1-26rote@gmail.com>
References: <20261102215121.738-1-26rote@gmail.com>
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

When the USB3-DP combo PHY is a mode switch, DisplayPort pin
assignments C and E put it in DP-only mode, where it stops the USB3
PIPE clock. Make the USB controller a mode switch as well, so that it
moves to the UTMI clock first and keeps its USB 2.0 port working.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index e48a179d0722..a06d5d867488 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3941,6 +3941,7 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			tx-fifo-resize;
 			dma-coherent;
 
+			mode-switch;
 			usb-role-switch;
 			wakeup-source;
 
-- 
2.43.0

