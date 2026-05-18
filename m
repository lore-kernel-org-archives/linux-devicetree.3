Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C21C3E7171;
	Mon, 18 May 2026 09:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779097236; cv=none; b=Eu0uUpMyJPS+ivJ7piAnS85/TPPWCaDl1s1D2HZT41jOYo2sxBeXkQbbgwq0QlT2hdR9sFlmJQLz/n6OTjMEpufIe77mzTvaUjb44KdhKfJKh37d1tm6toh/g79Q1mx7M7Gjv8ZZdf2c7pFuAXxOUWn8M44Ea+QqOAM6EXuHLiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779097236; c=relaxed/simple;
	bh=JI6pbX7lqlD0wSxfkIdhZ14TfT01Nxw0Xz8ExwuORAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Ms3igtqA9sI/CSZszVRoyFzpvitpJwlYr4Zlx+u5oDA0/L/j0Ae9tCS7XCtVLlZFJeK8sn1D24tH61d/2XrYGnWA8NSnpL/vJMcmP83cMI4fFJ+hie2gaIh9xjF3x3/rHgf0WfM3mJa5IlkhhrrBSaz8UIp7rHkNLVyak0z0+0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qY71INO3; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qY71INO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779097232;
	bh=JI6pbX7lqlD0wSxfkIdhZ14TfT01Nxw0Xz8ExwuORAA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qY71INO3t1EhC9K8QO02wp6qwFKPCcFjKAY9iQEDomDb1mLo8ZlUC738yMvCTLLaw
	 38Q4u2TL21e3VEvp2Se3ONw1xRykY13YcqrGgZCeZWVRlwXCtN5k0vfFWrEl4KCZLV
	 0TQHJN8b5L2WNscutrMbKdIWMfVNn3RrrXDQG9CJJnFhnifoYsorRUq8oDmXhPPXPT
	 ORAH3VLk33mcb5Oazmiy2usvE2JoIxYSRlLuLodCDjcvuZSSP/9NtR8iuMJPqunGHM
	 EBpPRM4AUNqYOP28Xe4aU+Fy5tBjICoKap/T0QGqMwZMMI0AdE14hDdEcSMsyBLnrj
	 d0naqypzpwqfA==
Received: from IcarusMOD.eternityproject.eu (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3886F17E0234;
	Mon, 18 May 2026 11:40:32 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260514101254.2749300-1-wenst@chromium.org>
References: <20260514101254.2749300-1-wenst@chromium.org>
Subject: Re: [PATCH 0/4] arm64: dts: mediatek: random Chromebook cleanups
Message-Id: <177909723215.34575.4108688585105248278.b4-ty@collabora.com>
Date: Mon, 18 May 2026 11:40:32 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Thu, 14 May 2026 18:12:48 +0800, Chen-Yu Tsai wrote:
> Here are some random DT cleanups that are not directly related to other
> topics I'm working on, but came up when checking for warnings.
> 
> The regulator related changes overlap with my other "Regulator cleanup
> for Chromebooks" series [1].
> 
> Please have a look.
> 
> [...]

Applied to v7.1-next/dts64, thanks!

[1/4] arm64: dts: mediatek: mt8192-asurada: Fix SPI-NOR flash compatible
      commit: 95937cbb6d51e0c6f8ac937bd043fb3b442391ec
[2/4] arm64: dts: mediatek: mt8192-asurada: Add (BT|WIFI)_KILL_1V8_L GPIO line names
      commit: c42235145c52955ab20fcb648bb8c7818f58282b
[3/4] arm64: dts: mediatek: mt8195-cherry: Fix names for EC controlled regulators
      commit: 2066ac078402301d9aa50026dee017182d316eac
[4/4] arm64: dts: mediatek: mt8195-cherry: Sort top level nodes correctly
      commit: 559b8b1524760ad8dc18d52c4415d40ee24d02fc

Cheers,
Angelo


