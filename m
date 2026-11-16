Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794862430;
	b=IiX+TLdkK053S/sYON+PyU0DTjYlp7DZPnk+/LgFnelmanRa1TGb7UzPR7VIKj9vjUzE
	 BmmTIJvPjD5D2+L43qW6DPCDhiZsJBI4o9njIswfl2wKMsZK+CasTYHp09m4gn5E7If7M
	 rOiapuDlnJ2aSCAP0A2ZM1jYCWkLo7QCyDVGXuRYX3qRwzUwgZHcAi1EGaNyH1yFAHG3Q
	 I16iTfd0vAnde7lnR8YKZcweGREdg42810OBsHlZNWcr/ZBLqmnoTkKSNTrP7qOb2gsvo
	 9HsPSdgvK0oWFTztwCEnJzaOgZO9nZugWP1oRmH1J1eksHBrCgP/Yau1WEILjZo7E0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794862430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
	b=Awl6BVgn2cc68rL8a/nPP+3E89EFmd1Hq57TcN9YYQjDwdvQzYs3O5KPILCYGOgI5QwX
	 iwRdwdJ/tCMGxEkgrsE3pLpa55Uk5H89grkwnALApEy8xQqvDmN/B6vkU2zaf7Ib2Y+V4
	 OCYYuTQ367GbYbiIp5/5gvYkb46t2nJWxPMnNBcvGbM7S2PLWhl9Arq4M3D2x6vi5iSc3
	 lpsE9doy8awRRepiMa14EDFz0aZh1rG/6Zy7v8DUiKQfvOgxqU+KC/t2COGl5dyiGYh3Z
	 eyLE0nP9VSX/5+DphyhDG5N1wGX3om0ZI+Y6krkF77I1VBBnZB/rz2SIy4/+IPj2sHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY2u0o0Z;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04F1606A89F
	for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 20:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E04F1606A89F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HY2u0o0Z
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3704d30b84fso4672948eec.1
        for <Devicetree@vger.kernel.org>; Mon, 16 Nov 2026 12:53:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794862429; x=1795467229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
        b=HY2u0o0Z8H3Yq7PlPIizj7S0ypgGnAL7reX/xHU7bT9irZqhQd/73nLumJhnzk9U7q
         tlzHPtaXOoZHTfpvgZerKtGtvx37zqg4rFJrOio47uV3UNZ6lWx4wZ+sN/pKDXFQ0qer
         ECkQqCNQhFSJbw41UPznMmFjeSXSzO1duG6eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794862429; x=1795467229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GqET4a1eR1Im9QVhPOdJb3YbweTmn7DPOs/OXRIvsBI=;
        b=i+PWaFLFIXtDSI30sVWyGT9yR29oLY89cWK4VfqlRwoaXguv/Ak5bUWGjKMVPcPKys
         GC2CvyqsNqSSht0IW0/4mkU8Z1LOj2575iYP9A0PjuvbZ0cq7aNCYu+0vsCS7iyj0jQK
         ogbUw726ZE+mVMji9Z/va76cLELVbtimAaK89pyEdpGIpF+YMyZVNfCoLVPomGK1KJKi
         ue8cQqsw87OnzHkK//kTxjoU0T4cuBOIKd5pF3UvEpVxGGovTUL+DV7B3EcPhZp9tQRd
         PrjAAICr5IECC2a5SEdVOstGnsZKWto0OeKEmtludd/p5gcXM7TC78ORRgAT5qvJpf70
         k3FQ==
X-Gm-Message-State: APuU4Z82et2eh3Mc+M6s5o/lvmI85jRwKbkv2Fo2pS+IEUrVyk5qkmlU
	saqRxiqqbP2ry/YSCyVpAX/PsO5JEKucC19s8VwNAOPhqR/0LDrbbeBywShsfN3o4g==
X-Gm-Gg: AZFdTZeU7pMTJ4fHCQv8aH4mcT8sdqxWZcL1pnP0YZ7oIIpVmP97Lz5TCCu8nCNV+xc
	LowIhLK+2ec9Jgd6PVhcqW8Hsl1BbBiyxDnXbgfbmyBBEd+x2Dy6MwiEhipz1BTDZRrk/TN50VQ
	Yk60uRDfFEsDpMEJqsBZ/gsRyeoFtLc+G8wwaaoSZLj7v3fVseiGt6N8gHWwzaphG9ri00zWNtV
	bVTlU8U+oYtaBSNbUA7+YpnzYa4FUmWFG1/7RUt1lDCI9qtE/YoteSNmBDZ8sUP/DRDaqoGGxTU
	okVdN4EDniSjY/Ju3VUfNvqM1NXh1jaTQe5gXFR8CwbvcNMIrI1EuiQH0fIEE3Wqa3xQqMZivUl
	Z4WwceX3ExhfNioBGQ8JUJ1KJnPzochs0rnMoKR7wGV1PDzmTJTRzeukgiVwiDYJ7QbGiAngdfB
	tittfbKEcdyAuGy9XBiWKCeWMt8dmylodDtjBcZc+1AGt5oSEa/dxeyGtRSZuV9MxoEktcKbScM
	WxL8KZyOd5qiGmS5sss4QCOgC5PIMmof/VEN+4hhmg3TeaN8PV3KnGnbpRyUPvWZsNfhpAGG88t
	in7FoIMmD9f6Xloqg2ykREmxSY4WgQ/e5k8kqLBtHx1YgEGUjUB8BWvP31VeN25k01kYG1ScQXQ
	HZOONx7/aS0lEpw==
X-Received: by 2002:a05:7301:2a9c:b0:372:79a0:e8a3 with SMTP id 5a478bee46e88-37963374fdemr11690960eec.1.1794862428808;
        Mon, 16 Nov 2026 12:53:48 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:40c8:6e27:a2df:3321])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm67120390eec.21.2026.11.16.12.53.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:53:46 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Saravana Kannan <saravanak@kernel.org>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Julius Werner <jwerner@chromium.org>,
	Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v4 05/14] pylibfdt: Unpack Property.as_list() in a single struct.unpack() call
Date: Mon, 16 Nov 2026 12:53:02 -0800
Message-ID: <20261116205320.1621386-6-dianders@chromium.org>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
In-Reply-To: <20261116205320.1621386-1-dianders@chromium.org>
References: <20261116205320.1621386-1-dianders@chromium.org>
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

`Property.as_list()` currently decodes multi-cell properties via
`list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, self)))`, which
constructs an iterator and `map` wrapper and invokes a Python `lambda`
for every cell.

Compute the element size via `struct.calcsize('>' + fmt)` and unpack all
elements in a single C `struct.unpack()` call instead.

On one stress test (decoding ~301k `/__local_fixups__` cell lists across
438 arm64 Qualcomm DTBs) this reduced `Property.as_list()` time by
~2.1x.

Assisted-by: Gemini:gemini-pro-prerelease
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found this speedup while benchmarking fdtfactor. It's not critical to
functionality, but seems like a nice win.

Changes in v4:
- New patch speeding up Property.as_list() with a single struct.unpack()
  call

 pylibfdt/libfdt.i | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
index ff9210d123cb..e4a9357d278a 100644
--- a/pylibfdt/libfdt.i
+++ b/pylibfdt/libfdt.i
@@ -931,7 +931,8 @@ class Property(bytes):
         return self.as_cell('q')
 
     def as_list(self, fmt):
-        return list(map(lambda x: x[0], struct.iter_unpack('>' + fmt, self)))
+        size = struct.calcsize('>' + fmt)
+        return list(struct.unpack(f'>{len(self) // size}{fmt}', self))
 
     def as_uint32_list(self):
         return self.as_list('L')
-- 
2.56.0.679.gc527c65306-goog

