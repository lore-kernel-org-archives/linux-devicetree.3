Received: from mail-vk1-f225.google.com (mail-vk1-f225.google.com [209.85.221.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623423905F8
	for <devicetree@vger.kernel.org>; Sun,  2 Aug 2026 08:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659970; cv=none; b=EIVxc036vAds5aooNX7+UmLK2CPLgLO7OoscUYZxm1J33aDikWztGpCgqz4HTdTccDys57jLd0HXlAyPQjgpVKQ/C07UPycMCFY5K7pK4m+c6qRrkmLo0i8e7KhM4E8GSndZ1xpAdKilqoCOpmtJ/pJpwoFhSwtBNGAxD4ZbMFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659970; c=relaxed/simple;
	bh=x4Y8UA5H6X2wKOtHY8Z9P3bq/NuZ+t9aLxAr2agzmGY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VjZ3S8M+JXjuZRLP6tPbMkIJlWH5avvRtNiuiyaDZADbrel7uJrasheyt+0jdlRF74IPrTTZgexwYlhlGzwOn6/AtwBblzu2AXVeowsPsGxf01Kp2k/Gxs+9jFRqHJTzKHm41sLobZl88CqLMjOOvDPMO2Oufw6Nxe7GnmL38VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=SUaFKJrn; arc=none smtp.client-ip=209.85.221.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="SUaFKJrn"
Received: by mail-vk1-f225.google.com with SMTP id 71dfb90a1353d-59b074ec7ceso922415e0c.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:39:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659963; x=1786264763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HU1HbP/1GwFKiZ4VPAfRk1yIp0CwwbjTWU4LCl4Ielc=;
        b=Bnr6je0yEG/OMTqLYI5aEK4l1yt+L9OnhPxuchvGEGbTGndpbyT6gU5SIO6Hap4t/M
         wQfKWNvv8YIiwollM+Xb65cJmuWF/3yFjEcYiFm87ybI+8OkICBSIhZpL4favzByLBxq
         itkIqG9/IFXejmwxhVWrp/ZdvJsyz0D7oZrs6S4Okg7BgXFun9WK3N7v1t9Yn4MhNZsA
         9yFiLhWptXOGc9GRizhGQ6poto6i+1fhWEfS+7QfPz1h7bFKiRMuJR67Hzt0OxEhj4Kz
         za+H3aDPIV8FQCpl/euBe5V2Six+sywGp5Xu1HBoPHz7/4I7xTaH2YMZj3EDFJy/Phq6
         flrQ==
X-Gm-Message-State: AOJu0YwcKMxpGgTjIt8FMr4eE6guyooFjB+3Tn5LWqIgM4B9agWRRrgB
	hwvX0X8kUKmiFo8usTcQ5mcSNihikAC9dljRcNLo6aNjSEZtB702cc8ipSiyzUerapsYHwQDuZK
	iIOOkgAZKJvkb+RumGlJKY2GC51uQXCKx0PoOC6Q3Avb1wEe6sUABDSmPOhJGFKEHWg3Ouv+4OL
	k0MWEFgxqw2OP1fhPnua6LJ9/azPXGWI0aI+eaPzcIKHJJJ73Vx8FIn6leQNHvrf5BNVUOxqQ3j
	ByxXOuym7QU9IBQbad+fs8=
X-Gm-Gg: AR+sD1354TBnZ38FIj+WYolpfclGgGfr37oiteZj1YQZglQSeQouYqYABG8+49zU6we
	QCeDa83B6jvKKEr+Igq11FY7okBYgE6YhVu00R/PeKQMo6bjY2MIhnlr7lpqQk4VB6rYGYeYzg6
	XSzVCpXlhEp3ie24vIlH8HQ4eoKCjk0kCoON6Y7iTRIo8S1f71yIKZeeCfUkx6qkPoGij7o2VQy
	V5KkPdmaFaDnyzEoYVnBpfS8yXVWqRcJhEjmfh/+L7aUNObufQzRMgjbNx+I6/QA8vrI0hqHEGb
	J2dbG1fh/dQMj/7HYXh6b3JnAsjQp1Ry9dM+/LgGGfNYqQ9/m+FBsSNErP3UREQqKQHlvHX2ZK6
	kGKTwyBG+LwFvAS2XBqOTFsMcpmiQ+bgTAeImKeuHABiN0JzqgPdtybSuMZMJHfXZryFXO4A49B
	WN1iomzzJTite2TvWehPm2zFkbopK75RkjGZuts4c=
X-Received: by 2002:a05:6102:1493:b0:738:84c:6b3 with SMTP id ada2fe7eead31-75b2196462fmr4672313137.3.1785659963087;
        Sun, 02 Aug 2026 01:39:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-759b8e272d6sm549195137.8.2026.08.02.01.39.22
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-907b38aaad2so26171506d6.1
        for <devicetree@vger.kernel.org>; Sun, 02 Aug 2026 01:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659962; x=1786264762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HU1HbP/1GwFKiZ4VPAfRk1yIp0CwwbjTWU4LCl4Ielc=;
        b=SUaFKJrn20rMNin5mVptfkQ/qNFtcSlkdQ2+0+B40jWhgtHPFen2hQiQqTZnwhAByi
         GSkBIqvOJPcpW1w0d9zj8/8iRYwF0mpKnNoaJ59BHAmcUJMh0FD1904VCSm6dfIaSp0L
         e2wGGnt3/qX+im5Sl1UtUcXxSm48BG5cbDnAY=
X-Received: by 2002:a05:6214:3da0:b0:907:c6bb:5ce4 with SMTP id 6a1803df08f44-908496b0b3amr146522006d6.32.1785659962502;
        Sun, 02 Aug 2026 01:39:22 -0700 (PDT)
X-Received: by 2002:a05:6214:3da0:b0:907:c6bb:5ce4 with SMTP id 6a1803df08f44-908496b0b3amr146521736d6.32.1785659962028;
        Sun, 02 Aug 2026 01:39:22 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:21 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: net: wireless: brcm,bcm4329-fmac: add nvmem-consumer reference
Date: Sun,  2 Aug 2026 10:39:04 +0200
Message-ID: <20260802083905.3819981-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260727225311.266596-1-rosenp@gmail.com>
References: <20260727225311.266596-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 27 Jul 2026 15:53:11 -0700, Rosen Penev <rosenp@gmail.com> wrote:
> The brcm,bcm4329-fmac binding has unevaluatedProperties set to false
> but does not allow nvmem-cells or nvmem-cell-names, which are used by
> DTS files (e.g. bcm4709-linksys-ea9200.dts) to supply MAC addresses.
>
> The driver already supports nvmem-based MAC address retrieval via
> of_get_mac_address(), so add the nvmem-consumer schema reference to
> document and allow these properties.
> ---
>  .../devicetree/bindings/net/wireless/brcm,bcm4329-fmac.yaml | 1 +

The problem is real but I think the fix belongs in network-class.yaml rather
than the brcmfmac binding specifically. ethernet-controller.yaml already
defines nvmem-cells and nvmem-cell-names for wired NICs, but the wireless
binding hierarchy (wireless-controller.yaml -> network-class.yaml) is missing
them. Fixing it in network-class.yaml would cover all network nodes at once
instead of requiring each wireless driver to add the same reference
individually.

Regards,
Arend
