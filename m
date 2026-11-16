Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870464;
	b=3Kn83IgrLQkFkrM5hKHNCUPDR+dm5k5hdoguh9e95eTIlfBr7DlU2rdZ2iK2Yh7kJl6H
	 39rqHKKJ/6rUY5dv+DdxgC0kurPXOD7qGcdmuSrh/FsSpIf6phEMGeyRklmz8dawZXxC1
	 nXHPsxG8I+ygmLX0fOL/pmn1n45WPdfrFdrYjg7BhU0AbxedNe5EnBFJ4QN8AprwNIyPq
	 Yk3VQSh3wyNUDzLN9oOCxq8l4Az3GtpRPl9NkZP6icI0IlR34HrqMlJJgJ5d9a31GwqGd
	 nAHVtwYOv4r4XQeNpUTPDo7NnktPqBs2eoakgA4F2TJ4/yo0VngBS8mU5M8G85UwTfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870464;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
	b=sD25mzFLl/g0UjSIbR4Xf2mxJyvC22NzHBgWy2jcXm3sbT7yt6c9vlzmTLQUFgimlmV4
	 Ylm5Kr2RqHmuN9xf3xiR5zcDxJMq4G75RMCPQl0/RUvJTrcDUk9UQtAireQj1Ztk0xtck
	 OryiLDBC3FI9tx454Aq3h2WQZaiLdf4XentB2zHNKcC05La8l0TlsA52nDgE67J27kLTK
	 aNEX6wy2N23mbYHKXIwfw9VeoUSTaYMzhuB1+wISjSmDdwVEbwZaZYOl4MbAE7Q5EfvtX
	 EOdfv+2veDkUfdhixEQVbDNXEfw15sy2JBRqilTMcuRyQwyEpqZIFIUnDa1VSiQQHxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y1aVRoSW;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC5606A32F
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 23:07:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AC5606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Y1aVRoSW
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso2220613a91.3
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794870463; x=1795475263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
        b=ltSm9gH+ejc/C2Oohw6hjecWHX7Drtpx6nN3lv8zTMXSkbjm3X19JQEMXUuTWLIpRi
         SisNr9v3Pxus2vC822ndfEe1im9r0mDeO+ShZHi/8y4XUewDpfLQWQF1WbIPaPELIg26
         dgcFUxOtnyuTCFmvIVvpwdzwfyLHfaMvJU+9HoUgezW5dM86MgiuTq2Y/Q9iyKX2Q096
         xKibcNPCokXIKVDjHY1+pG1lQrjlTPPxmV44XVffelpsuWlZwnyn1jvgkJBpwK+K7Gle
         Rbded5vVLEG7fystB09iQ8PFjb0+FlGG4RBEN4WHv5Fr85iD53Mrpg9qNrItDVauyE8J
         Mo5g==
X-Forwarded-Encrypted: i=1; AL+hErGh80ugP+j+dfx8cdWXA3kdWaFmFeXfk9fufRPzRs0pzzF7+8+qZruqTWLi2hDum+IN/Hl6W8E7xQ/f@vger.kernel.org
X-Gm-Message-State: APuU4Z8uR0v6zZLPDnUKVUvScvBntWH1Y5cimFYHnP0us3EIIRMxMsjq
	qogQgw+9Xv9vmGJQRsQQR9o+xKtvYOYa9WEdEAnsmFqht6eRqAorSQSOueYw9s8TahyYloHG1oQ
	qKpOABDrS/JPNblh3QLh2MfER1DRekjxJHVEkdIkk/dTxNU9p5dDd5jKT64EIBgVZPWQkS+LRCx
	f8HuqIUIMEjqG8COqdYaKgwdW5FfAdUGKQCXVArFSV7Fqmv+KjvrKtMAHQgKH0f/sTv8rK9xfS9
	esH4vZedNgXnzQ9oYlpdA==
X-Gm-Gg: AZFdTZfrVMYDOvdW7rZZTGlgq5X78QfLo1hBuuK2Yuy4whHWOC4wIz2793ybwjVVsmB
	0ZYYEeqsZlF9ZnhheLmfPdRF/XP+UEcRR+5nMeiRYG0mreuqFkwi830oXPdkb5AUFf3rqCEKJpf
	skUnRLnTuSoykfQYYlt6HnkL+Ui0xyZK76Iph5YBQs6zp+sLygjaVNcbrYqxxWGEy6Ex5PW09lX
	szggb9aMVBKR+d2PnhofEH5K2+WoIn2cRNitzKCLYmR6H5PDGW9eZQY94TTIqpVGYoIanESIOue
	8rOxOhGwUDgRTGN9CIyifWaDz9pHTxxNvQanLtuJtD7NQnMgXPuyRGlNYlXshgtDO+R2lWl934R
	7n/xWS2Gl11Abom+E5UDymci9oYRrEbOspZ0SpIJp+ZXyNXrmfxoMxH2YuriuTIKRG03I/HRqV1
	/IUn7naLUf/MmjB0l+lg7tEmeg98yUFwOIn5eE462D
X-Received: by 2002:a17:90b:394d:b0:3ad:47ce:3876 with SMTP id 98e67ed59e1d1-3b1b0ca9dfemr10952768a91.61.1794870462772;
        Mon, 16 Nov 2026 15:07:42 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3abe1c098sm561322a91.5.2026.11.16.15.07.42
        for <devicetree@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 15:07:42 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375f0fd31f4so2499893eec.0
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 15:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794870461; x=1795475261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wst+LDRzcSVTFePzkpCfXygrywKuV6vnyIhVCYwr1YM=;
        b=Y1aVRoSWpidXZCftNIebi+dCwEd+4KobpnVtHAFpTFuNyFg0wbWuxmTbDnuVIo4dXB
         AmNWblLmoyHKsYVe/mIM5RiYMAVK2PsBho2TUEc3hBf7eaVRcQutgIvdpnoxGqWyQDLX
         b5ye9NQ4994n1ZE6B6BtukmC8qjggruXTRHVA=
X-Forwarded-Encrypted: i=1; AL+hErFLNJ2Wf0kZCbA+NMLKh6NV7DJjmv0NWbCBD4C1ptSOtu58HNdtQYVC2zq52rjIMUv5ygWpZNxXZPDl@vger.kernel.org
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr12357851eec.26.1794870461086;
        Mon, 16 Nov 2026 15:07:41 -0800 (PST)
X-Received: by 2002:a05:7300:c00f:10b0:361:1dd6:531b with SMTP id 5a478bee46e88-37967600b2fmr12357825eec.26.1794870460396;
        Mon, 16 Nov 2026 15:07:40 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm36874961eec.29.2026.11.16.15.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 15:07:37 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	"open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)" <linux-ide@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:GENERIC PHY FRAMEWORK" <linux-phy@lists.infradead.org>
Subject: Re: [PATCH v4 6/6] ARM: dts: broadcom: Enable SATA on BCM958625HR
Date: Mon, 16 Nov 2026 15:07:36 -0800
Message-ID: <20261116230736.1490551-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-7-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com> <20261029212513.4126083-7-florian.fainelli@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

From: Florian Fainelli <f.fainelli@gmail.com>

On Thu, 29 Oct 2026 14:25:13 -0700, Florian Fainelli <florian.fainelli@broadcom.com> wrote:
> Commit 77416ab35f57 ("ARM: dts: NSP: Disable AHCI controller for HR NSP
> boards") disabled AHCI after reports of boot hangs. Both SATA PHYs
> remain enabled, but the disabled controller leaves the eSATA ports
> unavailable.
> 
> With explicit IDM clock/reset setup and the corrected shared PHY
> register aperture in place, enable the controller on BCM958625HR.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/next, thanks!
--
Florian
