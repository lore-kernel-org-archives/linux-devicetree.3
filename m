Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795205815;
	b=xGJVv2OAV1RWghGafhTpmmd4kRxptPH+52ZyO9Mqo7VpOXQL6fsPUJJFfUSqwhOiRYf4
	 vmwwWE+sOJS5KGAE7BtVpKiyixbqYLy9G7ahlnjO4qUBs+omXvDiucsyfBRUJf6GAX5W7
	 HRzJcRCTsj01XpQFpe7z/QMtlT14s+3SI8SM813Rvr7iR3GlBX25N8qjtGeuELCidYsJp
	 3FXd+dh+lCoVyf246epIGhajjwN7VgbhoZt3mf+r4Uf8+YeJF/Eo6ANNaJUGjL8GXUl/U
	 WRthDcx8Fz54g9wP1LMoGepVQP8mObiyJ3l0hU+Qx4PJdncuSJdO4SR+xcALqqbeTcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795205815;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To;
	bh=peNVHXoBFHgWsZZFgBktm0IIgj0OlxkuPlY62feLM9s=;
	b=DWv5lLa/wNPfqCQOQ6egXKFZBh3bVLcpD0Kwk3CVHdByeqRpzwo2V2ovT11SotxOqfnW
	 qf8xgVJxKGH1ed9JQNt/acGqtsYlr/5kCI4eUe+rCsRN1BPUaVltj31Z5mZDLLp7eP66C
	 9nvgvW5n3BpAYrVq+Cr2MGAAaT7X/2sm55Efz+JVmlb+GAAH/xXCFZBGrHkwZ9bM4Ftk+
	 e1hbm08zU9KJUMJNCy+wJuvT3lPZWk1aevysoEWvYTarnoW+kvW9Vo0ituIZ0hDuevlGb
	 X9UYaUvGMINgn2leoaSMGND/NjutrvF7NVNR+L5pStFJqZENF/FDaUY/UZgNCVpECiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cknow-tech.com;
	spf=pass smtp.mailfrom=cknow-tech.com;
	dkim=pass header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=gKHowIYZ;
	arc=none smtp.remote-ip=91.218.175.124
Received: from mta0.migadu.com (out-124.mta0.migadu.com [91.218.175.124])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2149606A6C2
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 20:16:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2149606A6C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cknow-tech.com header.i=@cknow-tech.com header.a=rsa-sha256 header.s=key1 header.b=gKHowIYZ
X-Envelope-To: devicetree@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=oCLNHmGkPtVaSdKOgJfSe9v1erehhFj7NdQ3Eg5hEtA=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795205810; v=1; x=1795810610;
 b=gKHowIYZCh6xFbfA3OQTaIxtY2Pm/e4nbwUKMbvrYX0yi9YQf3Oe5dbYk96M2L0oQkrQnRY2
 PiqomfO0JyG0qeJf9ciquCMsSVsgwFPZ8l867UyV0aJeVfiwqp1NFs8VtS3qPBf255OjnHzVPaE
 MpKmK7Q1/U18XDdOC4hkjghkkkBWhm0hRHHpgIoG9dn8G/cbxxLQNoxOOMNeUVEIgkIYHQQSE0C
 Iuh9bjrBYIu1ArwgheRJplKSlevturS39+Ccnlg+2OWB+spRk1FOcESvaGpk1p8xhdyZyy9hmyZ
 6iZy+fhsNzRkp5bYDX4sn7S5REXF12IehtteaUw/jk+jQ==
X-Envelope-To: devicetree@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 8603c6dc317910df;
	Fri, 20 Nov 2026 20:16:50 +0000
X-Mizu-Trace-ID: 8603c6dc317910df
X-Migadu-Flow: FLOW_OUT
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Nov 2026 21:16:42 +0100
Message-Id: <DN0BCGELZCSC.G0MWCPQU85UO@cknow-tech.com>
Cc: "Nicolas Dufresne" <nicolas.dufresne@collabora.com>, "Hans Verkuil"
 <hverkuil+cisco@kernel.org>, "Jonas Karlman" <jonas@kwiboo.se>, "Diederik
 de Haas" <diederik@cknow-tech.com>, "Dang Huynh"
 <dang.huynh@mainlining.org>, "Piotr Oniszczuk" <piotr.oniszczuk@gmail.com>
Subject: Re: [PATCH v5 0/5] media: rockchip: rkvdec: add support for the
 VDPU346 variant
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Daniel Golle" <daniel@makrotopia.org>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Ezequiel Garcia"
 <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Shawn Lin" <shawn.lin@rock-chips.com>,
 "Michael Riesch" <michael.riesch@collabora.com>, "David Heidelberg"
 <david@ixit.cz>, "Christian Hewitt" <christianshewitt@gmail.com>, "Marc
 Zyngier" <maz@kernel.org>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-31-g5c1c510d2b65
References: <cover.1795191822.git.daniel@makrotopia.org>
In-Reply-To: <cover.1795191822.git.daniel@makrotopia.org>

On Fri Nov 20, 2026 at 6:36 PM CET, Daniel Golle wrote:
> This series adds the VDPU346 decoder of the RK3566 and RK3568 to the
> rkvdec driver, for H.264 and HEVC. It continues Christian Hewitt's v3
> ...
> Known limits, none of them introduced here:
>
> - FFmpeg's v4l2-request hwaccel does not set the HEVC EXT_SPS_ST_RPS
>   and EXT_SPS_LT_RPS controls, so HEVC through FFmpeg decodes wrongly
>   on this decoder as on the VDPU381 ("Long and short term RPS not
>   set"). The handling of these controls is also the subject of [6].

FWIW and IIUC, Detlev has a patch for that here:
https://gitlab.collabora.com/detlev/ffmpeg/-/commits/v4l2-request-ext-sps-r=
ps-n8.1


