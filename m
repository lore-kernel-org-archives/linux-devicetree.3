Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530171;
	b=yLA0AsJxKsAW1kFtnYH4aSo6WgvULeJ5LOMPC02aUJ7JjC2AaEl2CyoMJNRqGs4eipbL
	 v3fIL2fRRFv8vTxCeMta8v3wq4akPl2JldwJPKWLeC6YPSDbHkMWOHmBhwmho2DrL6e92
	 2j6Vy2l94r0NqJd/oZGiD7ptnjB2JmzRkEdOaaHnba3dbcDATXn7Rgz6BFwlDXm3xQ+YY
	 cSsdtfDNeYagqYxAdt8dixcI4LBw0ctz52wlwpYL2oBo0bIkOTRMjL0ZBiyOAXDBcb6hH
	 QRxua02xnVGgNy/9wsXaN+W2C4BoWFLBajP/wj395wl+tJPJwhg2N/Tyb2Fm0AiuhFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
	b=qTiFgk5eWemjF+YPRoVR0uc2GIdOTf0r/erVb3ASLmzkqpOZU5TD9COesXOYC2EWnbmt
	 3esYQcHYAXdNQshpjMpnOO24DbZSKhgJ/bx4l5C2aCabjlmIodG8GRMkws7yFDH9tnxhc
	 l6Ktjj2RDSbz3dlxt0AijJj221wZUhj8XtkcjVvHrH0fo2mLXHok5jjSyHUycXQjJPl1b
	 m9TahvX0xiHQIQPV5AJ+xiHIwfhMtU/Fqv5iAESlG7xqjHRFSn+l/J1oBksNpZVgPNgUi
	 p+yEKVUQsW5Mm3uInUsx5Wr5GbLfOmdrR9i7GZ2UdckTk2QOPkh8qmoarOxaooSMgng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EAxmM9UV;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F6D606D185
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 00:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F6D606D185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EAxmM9UV
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so137219f8f.2
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 16:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530170; x=1795134970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
        b=EAxmM9UVr5xiS0EjOshRHqm2ayrWnv4PiCLsP67q5xGBXcB5fd+GXWiazf20EVgGYa
         Ht0TaImHEWIWoStmYdtD4MeeTDwKEJpEMjeGAmVOahXi9jU1yEqmNz55AE6JyjwOXvSW
         SYiE21tU0E+80N7/XK6oi0vN9HujuOLq4vhDcHmpup+n5kBwOFe65e+9AqW3cxdVXFW6
         lBWJD5r3EqB8ZfaY+XGNolHNt/+PgFBcYppc5QB0fT3p/35lwdwhcH7qo3s2ZaPG6MII
         CKXcBVBBRHAMHE70ZtyI84hUq4xyJ85OFpHYeydVEfaX8qJmQu0ZNV3WR9alL1z4JVcw
         KSPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530170; x=1795134970;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ArOGclM53rFb6FaD30XPdpkN0QKhCsTNqoQPSptCW1M=;
        b=bGTL8BIjRz9MTalBQzaGge4dL23IM79bxn4a4uu/uLZnLW2cbqd8LGOUrXLNRvlJWd
         xFaXtfWBo6mYpBgUyAY80FB/WE4kWFveHE5jJRdTCMxX7CbxgePdZh2Y6WfD+onPYaPs
         iP46BkoTfBWhGQp4+Xn0hQldUCQBIUtKwOP8GjPou4nTRD3SmuOg4I8FEWnwKue39tZd
         X96VAZOEAgLPXaTPcdAeYKtZTNOOFpmhpHqwxrkbzUPd5VbFmnwXO5yLV6VWschWCRon
         mDB1e+7pp1VcsbOvLo7cwrn4G9KnPHE8SsQtAO/VSj8KuKaX0MYvYFJgw2gz6AMUoPok
         IeYA==
X-Forwarded-Encrypted: i=1; AL+hErGuMNbXDD7OuPLb7ka+QQ1jH+4er8Svpkm1mY/txHJMG1A2YsY9kp0SVmBrQ0GdleG4WVhkeR6N+I7k@vger.kernel.org
X-Gm-Message-State: APuU4Z+2ocl7ulln0wsLTsQjMtpLxfO0QXD7Ki0oFtqRM1ppXzYLuqqu
	D7QjqYxdbNpioIp2y/te231h4ptRYVDHkl94iio+Cx1OcbRJHkSwySM1
X-Gm-Gg: AYBFou32lkteKHt2fkszRQCbmCwFGMYCHtifcWOqytEngFT8qQ/r1yVAF1otNa5eGwp
	L+LkIcuG4Z6Pem+7RXSaGMKI0L82+POfj7ZHVtR0FrpZHm7jcKrda0nLznzq9sPiiKf4KWhbUAw
	fExd18zc0Aa5Nad2zhHfX79fph1HIQtkAg1oQHeSt1MGw1RbSX1i6SQAj1y7kHh8YR0NZbEIX+V
	QpVhowp3XfsAww0gJhkPK1bNjwFbDTfQzQIyH7w0o6I/JuagOGwh2mF3G/TTJQDJ//RZJDBzPqr
	qJzrVrq9JOpNdCDq8eBlt1+Aj1SCXq1myqr4rsGYiRCTm/+Rh97nRj+AZ8bVFjjAB0jjnj91Vm/
	q7cyGYWNR1bTz+1ImSH0KHWfzYojwZ/0De2fa2DZFFxi1qcEXb1y9hgTIivqJov+dvG3g7fMndj
	QZ3WAhAsRNET5PzKIorbY5brlDrt0Q2gsU5g+l6bRcc/RFGjIiP5yqdpEHJMnjRLMfxSxoWQTxK
	86sGpT8nt0WV1QlOhYh8ogS011A6QIxam3eCUHFKTJoKb/2Bjd2wv3k55XfOEW2FPN6iL+v+6so
	fvwEHQnQu716h/VKAD/ymh/dty3htLKKchW8y1EMej7p9RSIbKoscNQx1AZo3g5/TU6NENXeFzj
	avZuMcJzN0XgNXJlFDR3HrfIw0FskRS+N2mtFuBBjr+gfmPDmWa/Pf8gAQuke+uEG1AHb0NxxR0
	Tj2469TBpxWnoCm659
X-Received: by 2002:a05:6000:4381:b0:48d:b650:69aa with SMTP id ffacd0b85a97d-49c72c9c75emr2405809f8f.50.1794530169802;
        Thu, 12 Nov 2026 16:36:09 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c602dsm1918847f8f.46.2026.11.12.16.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:36:08 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	robh@kernel.org,
	krzk@kernel.org
Subject: Re: [PATCH 13/24] PCI: dwc: Add ZTE ZX279128S host controller driver
Date: Fri, 13 Nov 2026 00:36:07 +0000
Message-ID: <20261113003607.3662439-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com> <20261010130024.177503-14-ghahramani.navid@gmail.com> <RqVLVgMZQZCOx29YUhhdJQ@gmail.com>
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

Hi Stefan,

Stefan Dösinger wrote:
> If this is a clock control it would be better to write a clock driver that
> manages the crm2 region and exposes a proper clock handle.

That is done since v2. crm2 has its own clock and reset provider and
the PCIe driver uses the clock and reset handles.

> For the phy parts that are part of topcrm: drivers/phy has PCIe PHY drivers.

The PHY setup moved into a PHY driver with #phy-cells on topcrm, so the
PCIe driver doesn't write topcrm registers anymore.

> By and large the zx279128s_pcie_init_crm has a bad code smell: It looks like
> an LLM translation of ZTE's code to me without understanding what the
> registers actually do.

That is fair. There is no public register documentation for this SoC,
so that function followed ZTE's code, and I got part of it wrong.
Agustin found that two of the writes went to the wrong block and had no
effect, see the v2 11/24 thread. For several of the PHY writes I only
have ZTE's values and no explanation yet. I will try to work them out
before the PCIe series, and the patch will say which values are just
copied from ZTE.

Best regards,
Navid
