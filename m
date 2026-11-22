Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373677;
	b=R96Q7C1C+F+KRcywx24jvf+HF51qBGr0BMhwzpmiFRLazrFVoDUjBxrOj8vjhPNAk8kd
	 3k/82i8TDCHiE0C3zUXVir/bSZ/jnU89QMK0DdmHDNIzoVUy5FDtND3d43CELzAPfHT6T
	 UcIki0XfNoK5l6GqK0/8bTi/lDO/PAEhSDfH8Km5tyOIMwq2iSuZilbtGLN7fFE3HW3mu
	 MMAeGS8nu7o8EZYLXbUudS4SJ2wi7k/xUET1ORER1ThjpVow7UkSy1ZgQ+wn5xFRLlx/Q
	 KHfLNccZU34BzijujpoHz+N+d91fHFCuQL01OKfKZH+vF4Ta1O3b0IDo9mtchWWRncw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373677;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Uf40K/pvodARX4TFG1e6YUSwIbzlkO0+M9Bn1ppfz2s=;
	b=ukEYuW8SD1+V4lAdgdmHgF9iWsh/k8qZV4Aur6c6vfd9aVzhhMB+tjz1+8V3BXj0Gzk7
	 F8ZMmqaYrLBYQUBU7UrMctUj84lWHihhULUpTDMoQmicWYd+uhvz9fgVFJtVkiX8ag1rJ
	 heJuZ8OPjpiDRL0vOheLzlEHNseeVysJhvtHCjJdInQuzLdnh3gvBxf1vTkxi2CrDq00B
	 y6FmqcwNQR/A3Qm+Sze8O4Txtc59hMEihyNaYUn4829ILZwgy4+xenGMOgnXfvVSj8Up4
	 zgS4k8jDGkp07PleJmZBnFtPnKTsZHcp4so9SiEw2B9xqSVxv90nOoUnrUEx+ulzKAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Iaef/p1i";
	arc=none smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA03606A320
	for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 18:54:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EA03606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Iaef/p1i
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6bab10844b5so471058a12.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 10:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795373676; x=1795978476; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Uf40K/pvodARX4TFG1e6YUSwIbzlkO0+M9Bn1ppfz2s=;
        b=Iaef/p1imBWOYDmFzHXqlV2pxfpBABeFA3v8p4Ao3xWCNO/2WMkjIK7UFKLAhGbkHQ
         POed4MhGLKUu+6WzHKcEYOMAiZGIVKDdsXbgRwFtg2SHdsDPHWxeyWalcdAD9kuW/EHa
         fLWSGH4J3uVWyTPAMWv1VATk9VdtjOeKAPfUKTV19sQ+Ksi88M6REDfSGrWMI2//5o3P
         aQCBEHFmcqwOjQAUvvpM/hm3+UIs1vrw6rkhSgjoHSbMyZ1O5mrJRs7D0VOj58zirupa
         iVsYC2JQTx5oJtocVzDklyBNANhQMYjhcFbv2lxkTH+D5wK5q02dgXjHcFavYOTM5zR9
         OOSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795373676; x=1795978476;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Uf40K/pvodARX4TFG1e6YUSwIbzlkO0+M9Bn1ppfz2s=;
        b=cLYl6hrWTAhYzH00UWzVXjO0jvo4GyUc5j87wohyLreqDy0h9DAuuzxiU+UjvsMstT
         oVGBLBCakNcEAr43U7lZilcx7j8bmtgYVWZYosvHs8cj3/CBZ9OaN1g6kncxZhHrY7O2
         YfkagggYZrXjYD+mzCdifIT8TZZQoF3yX642GJEV69qcnTxCSMqbPRspoXdqFNqi3zMS
         gpuqDgH/sBiQkHl1m6VkxxHIEs86527WPKNyauaGegBAuuz/GMPz1NwKeecuuzQUjG8b
         Xb6G4Jsbvfc0uNCrWKi8YjXxtqmuGLZQy2M0sM7epcB/KWet3vcn/5S+8SswlYe8JSDA
         Hl/Q==
X-Forwarded-Encrypted: i=1; AL+hErGF2Q4PO1uauzwAjmPsgF9c25CDeeLIJxUatWkCw7uE3U+wA2IuqPLJmNYAZ9zeq3wZTw7oigLi4OcH@vger.kernel.org
X-Gm-Message-State: APuU4Z84lb6GrZt3pEXVL5kTI4mQ/FAwgK4lHaQ3YjnT23eB1tT1CyVV
	6nNQ/B3TXHoPa2895EvSmImQFiWzJ7GlkiI3ufNFstnSAODldwCC8UkN
X-Gm-Gg: AZFdTZdzg7Mb4L+JFSn/FN6ALpSkRMaq165XZvm6V2W3mjlFrGYaGOUYON9pDV5s/cN
	NLk5RIZG8IJ7ZCdu5qUGGukw8uoGVsKjLTVJQZf39K0ChQBlBVEWeEhocGO42CsIxndUf6Mw4HR
	ra/u6PXOD56lKMVB3J/5yr2Oc1xP/sZrG9HpIKHpbKRhDMSDBvI598DFA4eoCVDHYqN1F6LQYCR
	7m+QsJd5tRrdhVJ+h0WsQJmDXSwqKRevVyQCWIoHT4j6+ySVDBQAKl68N00IWk7KAFzYU1jC5NG
	pBV6FROpgEXCUkiPpp9hnG7MKq0NG1VSlS/xAJZ7RDkLs8YBk8QW2i6UxmP3m/tOGiihnxVu23T
	ZIbOlHVsDan7ZcEyF0if6lq2470opwTkpNGvjE5ABSKL6KKgI6M96cXBjGl86MijeFF1yh8Z1JQ
	HbmxgMXaBdH1n6RTXVCbRjgHOcy2S1G84orJ96NEGv/PBd+7HrI2Z0NwN+DAJnrvXnyKYI7Lyad
	dpcnc04lUzTlDSVXYU0LAB/Rz/PYP7cIh650yUSpO3OOJ9FkFItcj3Yd7nvK5Va1AKczhLtOACf
	zS0S900I4EYqR+V5gwypRBKb2Q==
X-Received: by 2002:a05:6402:22ed:b0:6b1:c285:f8d8 with SMTP id 4fb4d7f45d1cf-6ba1fb0ff8cmr5919856a12.11.1795373675341;
        Sun, 22 Nov 2026 10:54:35 -0800 (PST)
Received: from dl360p ([195.155.168.55])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm2385762a12.36.2026.11.22.10.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:54:33 -0800 (PST)
From: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/3] power: supply: s2mu005-battery: add S2MU106 (Samsung Galaxy XCover5)
Date: Sun, 22 Nov 2026 21:54:30 +0300
Message-ID: <20261122185429.557309-2-tadilhusrev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DN05PYTW4NV6.SOA0NRNOJBAR@disroot.org>
References: <20261116074000.355176-1-tadilhusrev@gmail.com> <6afc2f77.2bb6edcb.1518d5.5d4f@mx.google.com> <DN05PYTW4NV6.SOA0NRNOJBAR@disroot.org>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Fri, 20 Nov 2026 21:22:14 +0530, Kaustabh Chakraborty wrote:
> Actually, this one was just fine. I didn't look at the patches
> meticulously but it seems like it does belong here. The correct approach
> would be to adjust the driver correctly so that it accepts both.
>
> The compatible patch is, in fact incorrect. The driver clearly uses two
> separate compatibles for the two devices, so there should not be any
> fallback.

Hi Kaustabh,

Thanks for taking a look. To be precise about what I was reacting to: the
unsoundness wasn't that the same driver matches two compatibles -- patch 3
did add a distinct match entry for each, with has_monout set correctly per
chip. It's that patch 1's binding declared the S2MU106 compatible as a
fallback to the S2MU005 one:

compatible = "samsung,s2mu106-fuel-gauge", "samsung,s2mu005-fuel-gauge";

That pattern exists so a kernel with no S2MU106-specific knowledge still
binds correctly via the old compatible alone. It doesn't hold here: a DT
node that lists only the old compatible (no S2MU106 string at all) still
matches s2mu005-battery.c's existing entry and takes the has_monout=true
path, reading MONOUT registers the S2MU106 doesn't have.

You're right that the actual fix is narrower than what I did: drop the
fallback from the binding (require samsung,s2mu106-fuel-gauge on its own),
keep extending s2mu005-battery.c as patches 2-3 did. I went further and
withdrew the whole series for a standalone driver, partly because I'd also
talked myself into a chip sharing three register offsets and their scaling
with another, on its own I2C address, not really belonging in that other
chip's device tree node/driver file. That's a shape preference more than a
bug fix, and I should have said so as a separate point rather than folding
it into the same withdrawal.

The standalone series (dt-bindings: power: supply: add
samsung,s2mu106-fuelgauge + power: supply: s2mu106-fuelgauge: add standalone
driver) is already out and hasn't had review yet. If you still think
reusing s2mu005-battery.c (minus the fallback) is the better shape, I'd
rather hear that case on that thread than have it settled by default --
I don't have a strong attachment either way beyond not wanting the MONOUT
bug back.

(Resent for the lists: my two earlier copies of this reply went out as
HTML and vger rejected both, so only you received them. Sorry for the
duplicate.)

Adil
