Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793463656;
	b=R6xRTiRViw0In/PmnpaLftCLJISY6FvuZ0tgR4/DZxsw0HMsmCoc2TPIND7yWP3+bdic
	 mu+0f/S03muJnU729qH2+oQmJHY/IiidgW2tlGh/1YzYb+4GXym+CXmAtSLbphVEabJYA
	 6B+B8YGytXTeuPpJ7xpqLG5kKo+hYmUft/K18Ih0AHlW2Hw1g/h1DJ3J1RdFuDBepcykz
	 1XNmmUfMeXD9Ep6pEhcTuX1aRuDragLVEqrL/AFwGZre652eCJhQuAeU8kVCPVBoJO8l2
	 nSuwH5vhk5U0TPJCSacqOAimOwk0hVsKAsQ4Cqh0TWGiSwPDjNRlT0h/vwQ5IfFzaeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793463656;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
	b=FlYmsgXeyP+Ng4hkgNuxKyKg+X4IZUfmxG7qRenJ1tK02+b6ht35oI56XgS708ZwjXky
	 FAx3YnoLEp8Is0ONX4P8t/toVZYxBDa+10FfJFFdSA6Ykr8xb6GSqzc3oFblQo/mBxeNK
	 XjAb7ISsegKkfq/3PuTxtA/swWi3kSk/RQfTSVISiMQTwQteLQ9c57+K94qPcXu0V6XbT
	 4C3v2Tj/o4YyoEZJvok5y5rscPRVxleX506fno9EA85nPLxeANDSVSDpipX7pwY7Hncir
	 EU9W3ZDq0K0aLsFRCXcN07tGgnjc6dhRs7rBBiaaRJAe0gkU4Aued2ehK8RJO10lL3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JczIkbL1;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2890606A320
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 16:20:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2890606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=JczIkbL1
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36a315ed211so2063048eec.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 09:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793463655; x=1794068455; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=JczIkbL1RPqV0NjfLsJpyvphxk7j/5rI9Ezb/PTfbtWFz5+YMiziS+VcXmUynnQu+Q
         1DSH8Xr+deD0f7s5Dm+7F7V73OJZL86pd1joslMAhTW8Pc724QTMlCiNclfIzYtk0Tae
         zWGJMgGnQKCDR4Aa967vtwfpj7x9GAIGYcM30Gj37kVexv9l86MhQud9bjFS3umhsAcy
         /4hugcLQCutRp+dJ1ovUwdfybPSqX2Hdie1WQ8sIfTcVTWR8bJbwXhXXwsj9Ca12lhjC
         BxFmgVoZyldgfpDd/SpWqJnvVE5naA+8r+3j92PVF/htHNh4u0aadl51mo2aFnJNOsSk
         +6hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793463655; x=1794068455;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W6O9uDDdkqX4ekXCbjPTdfdfIwrIVMuQ5XXW4ZXzbsk=;
        b=H+vGx8ArtLFaPcUFeHYNoXEpHev8WscDYb2xQhoCRcc9SBHdVVVPu+r+9xSEL9o3CT
         muUiox2guGgy7GFK63KWMKxMlL1dJ6WNP228Vp32p13nZbCQf4p/urMzyqwRO5V7WY0U
         wRqzAAENt0kQkLHA3ORaqwpyl6tiSXh8M8DpAkMiDXof5OVbYOdvfaxcWX+/0Bz34c+w
         jYVyT/y1qWMkfSRIcQjCsddyJxkisGFv2iQJuNVQpxROfdv1Lu9Wmact1PY7h9arh/ZS
         1CM0KhuOvmKasDfyxFvogh5TTJ133Ht1ufZ1BMWwxG9ZH03hMp0Fhf6nmDJA++UiFejE
         N8eQ==
X-Gm-Message-State: AFq9FYIiEu1AtzLZ0hgp1rSYWgc7fq4cO9j09mV5T4AJ5aQ5m7EkpYCb
	7d2njMzCf7Wp+ZJNB7Xj7Q8rWhBuKrRcUIbfma/ah+/yfPNVzNgE8O/dwCCAKUPfprE=
X-Gm-Gg: AYBFou1JgJk/+eLKh5Y2+iidtxBoKOEY9JR7mKPPkTkCA/7JUn/4Z8M0CGgm8feewzG
	4/MvB3IXJEV1asZo2t3OuCqPjyenhVQ3B3wZc6tPB3bxvUla8SimE9JpmfZ7ds1CQpJvPNHQl5D
	+r/CfkiRQ4AfJ2CiQGDPWoXd0wx2liwhaVdCclOYPJbu/Qzm1nfqEuQK5jGOL3ddsysFQ8IM32t
	/BwECF1B/3cCuaShwP1R04t/6gOsC2JKsljm00cG6v/J3lD0PeEcIwVCD5SKQOC1P2hr1iaRr2K
	MVnUreMUFTmvebKQOa/dgWN/Mg3sLqKdA3mnQXadf56+AjE6XTIV9nIU6XsmPSlgdSNA974c9vw
	aUGv9qI3x3veRUukGmvRsNRBPqXi/9/ZmU9xOtkCWI34DImb6/voIPhD70UPAEr636UmRaCJTJE
	SK8SYFYYgYRklhB3W1tqKqF3d2FPtpebgZXfC4xKTfDKGwnI3YdtLzZkPTr/FDQDnG2647TfkAA
	VSLB9Ro+bjC30NChoI02UP2tJzIWJGDM0nWw751gPlz6JTz1zxasugcVQAC19q/XVwUzTZUmuuW
	pr4DDnngNiVziQaOxoRIw0mZKtSyqyAQ
X-Received: by 2002:a05:693c:4088:b0:36a:2f6c:490e with SMTP id 5a478bee46e88-36a30009ecemr13020159eec.6.1793463654705;
        Sat, 31 Oct 2026 09:20:54 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428aed76sm19185195eec.9.2026.10.31.09.20.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 09:20:54 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 31 Oct 2026 09:20:50 -0700
Subject: [PATCH v2 1/2] dt-bindings: eeprom: microchip,93lc46b: add
 Microchip 93LC86C
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261031-eeprom-93xx46-93lc86c-v2-1-d37331af73d3@nexthop.ai>
References: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
In-Reply-To: <20261031-eeprom-93xx46-93lc86c-v2-0-d37331af73d3@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Cory Tusar <cory.tusar@pid1solutions.com>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793463652; l=768;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=xjNPYYVD4NJkISRiv4nk+t+tiwR6bKadykG+okrWRDY=;
 b=G48/sisg0sq6ydpd2JO/2jfaGeMD3D6AztrOOuMMFcnWBoZqitpohPZRWV4sjFMOnw78U1u7q
 UW1GLMJu681B1Ksh0K9btIv1LBX9JClUdSXSLfoBRdQ6BWYjMRmE65z
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The 93LC86C is the 16 Kbit member of the family.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
index 144e86ce5c0a..8e782b70386a 100644
--- a/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
+++ b/Documentation/devicetree/bindings/eeprom/microchip,93lc46b.yaml
@@ -18,6 +18,7 @@ properties:
       - atmel,at93c66
       - eeprom-93xx46
       - microchip,93lc46b
+      - microchip,93lc86c
 
   data-size:
     description: number of data bits per word

-- 
2.54.0

