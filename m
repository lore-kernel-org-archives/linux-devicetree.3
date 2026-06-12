Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E62233CE9A;
	Fri, 12 Jun 2026 16:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281357; cv=none; b=IQxeY7/Wdr4AXDkzASIKs6lLlj9WrYTmu9glm5qzhxphi94KYi5Z8eUwc9T2bnqA5rg95Ogp2c9KZfXxN9uqm7oXE7fVYpkgY0Ww2WigT+Ja8Js1j2W4U4IKlQAADdBDD4vuuqI64Uj1c1pxLLwZi18EMeuyh3cCz262T7QS5YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281357; c=relaxed/simple;
	bh=IVvjDAiTX+EkmoCtAYwWgF9K3/13Sbwz2Oz3EOrZuyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cDeyOoA90yyilUPxFaCIDEBMoAOAD8r9zWWDmJ0vsl5JMjsQ2FqqJgYl6NybaOTra1/8c8AuhmsK+wIEhYtfj48hAFAIodVl3TZRG0V0rP/zi+MmcHImKlOPxCAkmCcPlS9016R5XmFyu6QWyK2PMllB2uMPVITezOM4jXCh1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hw/LGPTg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hw/LGPTg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15BA1F00A3D;
	Fri, 12 Jun 2026 16:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781281355;
	bh=OVPiKHbP5F+x5vf3YbVR/fxqVUp39ETAng9/6pe758o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Hw/LGPTguhY8NgRIzInzXZoBTpcRlDBt8peOuo8gMRS5wp3XItJevTAIyFzNXqzZH
	 yzsfJMfBgIIMtrxwaSJNASDvLdqZYcWAI0BtcJ9txZG5kabb/Hw+wbsPCOiCumNMAG
	 pfk1GxROopS9N08EyvAUOJ0FwbGcLNHhMDKaMrWCcIY8Ni943gMMrly58CigCaA9em
	 aQ0JgIEiCcnHSE5z/Pdo44jqS+uWyH98+BsZybS2FlwawWaJfzZRAUWST6FUxqy69+
	 d1t1NlTFrde0GItkmVeAhAqMq8mby3gZJ+vPoibb2OupsASfYoPbVkyadF8w9JLqd8
	 xQVRfzTVLVlBQ==
Date: Fri, 12 Jun 2026 11:22:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] docs: dt: writing-schema: Clarify what is required in a
 schema
Message-ID: <178128135345.1154740.3219775491208873528.robh@kernel.org>
References: <20260609103550.234472-2-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609103550.234472-2-krzysztof.kozlowski@oss.qualcomm.com>


On Tue, 09 Jun 2026 12:35:51 +0200, Krzysztof Kozlowski wrote:
> Clarify that we do not require all properties from a binding, but above
> schema keywords/properties.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/writing-schema.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!

