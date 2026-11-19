Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107266;
	b=LC0Rsb9xNXa+XYAbMXk1xAZYXqr4rPomefwGi5rMWl/LYoG7gQMQMeCDM2/HDizidEhk
	 91BoOFTwaLSUPYw1Fzy2H7B9rrxVxq4k7AM/Qg+2l+Y00wgaOfPg8jv5Ft9M6OsZOuaPp
	 V1LFd5TQ+2PhThumr14BxIQM69se+I9ZBUv6+zCYnoL4Pe8vrAEZBCbajY3D+2gYtUVVN
	 FflHVRLcL2rRBZRdMwaHRc7SQZ9UJO8Sf5h/iuoxVqIy6E45y+7evVguuKsG9kUzpyI+W
	 dTY3AmKx24ScQqpPocH9N3mNr+OcXVv6iFMNUWsX7hIeG8UBqPDuYEM2J3oKgY6cyUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107266;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
	b=wfTsEiCQbtDTIw88GUg8xV4+CXjE5ym0q9zxZDBBawe+nVactowplZatZxjtcazIexmg
	 l/bY1DLg3cScCxN6Ya0sZ0zwUiuAeq/xV3adGbnbE0dYt8yCikcpaW/cCj23irWtUb18n
	 nUG11b+QzI4Sc+Dw93aaJTF+Cz5LiPqsBjqj9QzE63+y/zUbZFg349w92gX0+9c0f39Vk
	 4MWYkJNPuQ21nb8KG7/UB3IkulBCNt42KwszwD4UHy1XnITd9gDqdIGrjyps8HFlO1Zp3
	 BbPVThoKdmKA2JBpyosQryXXqSxB/ONCA+4BzPIn1kovGM5pCnQv+A9QtAqhk13M23g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D3606A324
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 16:54:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 358D3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yMU5F7pE
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-492690dd5daso2160735f8f.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 08:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107265; x=1795712065; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=yMU5F7pEic3WVSBK24VbKUxHb+6uvJTAIVgjWdxbMw4XrPOaSJE7r91tNCsliqQHaC
         qUZ5AZm1wcdjhg5SrKK/Ip3xFQeC4WH3EWfuhKGt2XT4qXNdxGvhP4n4JZToUqxlS8Ow
         I92yF98dqmRTf/ArtA4sBnN+AainR8sDe9FkRY0ZduALSURpwPh14khnTslQ5LzzN2NT
         wgcHnaSFPMaj8w83bxuyS0gTYRA9qb9F8740IOKVqC2JpoJaV55hh+Ddm3gPRJLYGvse
         aP2oDAyuagJ3p7ACBi+M3SSu54fU1v7T73M9/axItnrn/NlR3Y8jwyws5kkRF8YkbAgk
         QDLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107265; x=1795712065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YcT3yZc29jCRS7MnDgeTGGcWUyCQ1FNb6W/JHHtK0hQ=;
        b=Jc2Htyf8r7og6t3TgU6Lww9WMg7rDwOARBOOF59Ww6TT47ejYDaw/LnyA2fRLemRNw
         T5AtN/0tNTLPIuWzbBrzdvUrVBC88VpWERzpsSxpvCYJtaTatI6u09iRSeqDgii01weH
         /MpYU+Ml/vHJMCfrBlY6jFd2vyzSSYnm3klG/xZk7VEMMvKLNZHDDZFCpK9R5H3TiZSU
         e0gOjDJpGN6sw5Q2sesF/YWHRj/Nov8EiyHal8w+tMGxhlWNG55HdtxiRnBSx8CBoDVi
         KT21WMvgSQViWzKKDyemLIgbguc2NKcFkxksRKPv5kSpXgSRRYJ7Bps53++zB+LQFv9r
         B/Eg==
X-Gm-Message-State: APuU4Z8gMCzLq13NfP2/uuqra2sGK/WwP8nr6kny8SOn72HZ3YEbIset
	q+5XOOp2gC3iORp2Ck+YvaFd2aPiTyzbED4IYy9JgPJ1TQH9MWWQCYmN
X-Gm-Gg: AYBFou26npF03tDu4p6vy2BYEKIyrzOINDhw4i5ssDSygZW3DWDpXeE8k2aAHWqHpKM
	gnOSGNkjn0hCgdyFCtFyVyaWSI8dwjjhApW7erl1nTCQHugoGSAmhagQBmmB3KxivHgt0FEJwX5
	bSykJbUUhBEfYy1KRMA1dAB39dS0dPFwpDmlamNVIQN1wzytO6VcQ3o2/8/sy3QyKR2DWQBSR73
	6zAPmgp/qpvUes9Ub+BpX9ut+EAyHK3rd4oz08unMID/0h/SrgWID+eYadbkW6/OxnlczJ6UoRK
	Zz03KqeOTXQ45r8HSmvsnnBLfv/Eo5YzChTwwvMDg7bSVZbLUtXWlJ/XqU+VMRcg06LDHWPqHHY
	pddVVt8tijEUqduyEgRHSNIqV8v97H/jz2CCRYrWFNf17sZ1+504i6e+ARxaCR2fUsU/idj3SXq
	WoWhjqaVvAz693NRstIANQeffjMKIjzC/P0YqziCoGD5kq3AvWvSx6igNisyRB8gLxQrxpapnuM
	dPOrhlnFKLV43GQbKY6y4qz8wmXGTfj7hA2yZt3y/qhfjK9KMY1/SUcQIXTKQ8Gye0qmEs+Jnvx
	oOLWDC1O/eRqGCmhKi+tAy9AgmutlJ9yPPTcLM6NCAsdVCNZ7oYh6wWp4GKoxnbGt3QxLc+Ip+U
	=
X-Received: by 2002:a05:600c:6749:b0:4a2:1867:10e8 with SMTP id 5b1f17b1804b1-4bb8881a294mr1876395e9.25.1795107264467;
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:24 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 01/10] dt-bindings: arm: qcom: add LG V60 ThinQ 5G (timelm)
Date: Thu, 19 Nov 2026 17:54:11 +0100
Message-Id: <20261119165420.24466-2-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

Document the compatible for the LG V60 ThinQ 5G (timelm), based on
the Qualcomm SM8250 platform.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1ef..85635a871e7f3 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1139,6 +1139,7 @@ properties:
 
       - items:
           - enum:
+              - lg,timelm
               - qcom,qrb5165-rb5
               - qcom,sm8250-hdk
               - qcom,sm8250-mtp
-- 
2.39.5

