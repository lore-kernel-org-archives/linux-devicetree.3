Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D2131F9AF;
	Tue, 24 Mar 2026 07:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774337509; cv=none; b=I96lY3hik9/uTGO/b9fkcM+qMmU7pEW1iBj8uDBK+feeZuU2t1qvWPqw1qi5v4xdlZXxKH8VMz6K7MqDfgYgkLs4KUmVxuc2MWJ++3p8FtNlRTq4SiHsNFg2TU4YlXBZ0pSHQ2kMHJzvXViPNnEs+5vJ3Qi9sa3TQ3F3l2yblKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774337509; c=relaxed/simple;
	bh=78iPV2L5TMsaJOeMoG4OcYMZODPjNSNMXHg4QJLAJcs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Fm7bZS5+oUyNgOak+tifoXxaQM3TyxnBUF0muQOtH9aFN8o3RHwtDxoYi98eaoYa0aREA/YphFHQ/8dtWZZnUpq69xiSkbox7sKcp+TD3QFL9OFtuVaKGW3wpnVnXOA/SGTcsjsB7wXyazjKBE1/raemqjEDNCDsP5iVUsFLo0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dzo4pChV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dzo4pChV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D7FC19424;
	Tue, 24 Mar 2026 07:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774337508;
	bh=78iPV2L5TMsaJOeMoG4OcYMZODPjNSNMXHg4QJLAJcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dzo4pChVpkYklj4HxjUfE8vj1s1WObxUbHDX3p3jnYRosOdQb5JIf9PQY0VA4JkEQ
	 38Di7xSsE+Hdj9HjumIyXaQ8UE8Xnh44K4w4ZZA9hq3TSUruJ9OrI80APISNbBywDH
	 8FhFh6mhkC+N7kVnTH4ww9jR5f0iH2/Mz+tzSGllNUJN9QqKhYZ3HVFvUt4TiGFO2i
	 veH7jhzIf0M/YRq8KXEZ4Rh0UYUGYUeLo6q55SvO6LiOTIdRDPVu2NWeDp2gzjTz9o
	 kz3ErjmWjb0tWkaTJie8K0ojs2IaLZaBXQRq5gEx2I6V+FNERd34TUR0kIthOIIZx9
	 8BMLkA46v0wXQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Frazer Carsley <frazer.carsley@arm.com>,
	Hugues Kamba Mpiana <hugues.kambampiana@arm.com>,
	Abdellatif El Khlifi <abdellatif.elkhlifi@arm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 0/5] arm64: dts: Add Corstone1000-A320 platform
Date: Tue, 24 Mar 2026 07:31:41 +0000
Message-ID: <177433744044.1351878.7906196605172930598.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
References: <20260320-dt-corstone1000-a320-v1-0-a549dfcfe8da@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 20 Mar 2026 11:47:13 -0500, Rob Herring (Arm) wrote:
> The Corstone1000-A320 is a new Corstone1000 variation with Cortex-A320
> cores and an Ethos-U85 NPU. This series adds the new compatible strings,
> restructures the .dtsi files to handle the common parts, and then adds
> the new Corstone1000-A320 FVP platform.

Applied to sudeep.holla/linux (for-next/juno/updates), thanks!

[1/5] dt-bindings: arm,corstone1000: Add "arm,corstone1000-a320-fvp"
      https://git.kernel.org/sudeep.holla/c/f9d162866f2f
[2/5] dt-bindings: npu: arm,ethos: Add "arm,corstone1000-ethos-u85"
      https://git.kernel.org/sudeep.holla/c/55de145c8ec2
[3/5] arm64: dts: arm/corstone1000: Move cpu nodes
      https://git.kernel.org/sudeep.holla/c/903528ac234a
[4/5] arm64: dts: arm/corstone1000: Move FVP peripherals to separate .dtsi
      https://git.kernel.org/sudeep.holla/c/9c3904f94fdb
[5/5] arm64: dts: arm/corstone1000: Add corstone-1000-a320
      https://git.kernel.org/sudeep.holla/c/87599f1843d3
--
Regards,
Sudeep

