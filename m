Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19A4401A22;
	Thu,  7 May 2026 18:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778179702; cv=none; b=uwkcRqrSbRczBsKeTJidyifJxxhqSX65JtqV+xU+DisH7GSPB9RdXJe9cSncknO+n7uEjRjLDWI0oTWvDXMgnUbgYMXUNTQ/hhe5laCaxCWTnspeIsFU7s4zZT75Ea7B/aKkWLrrriXte1BjRQaJtIybbpzh/muQN6UylrnAkGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778179702; c=relaxed/simple;
	bh=uKezpq6CL6kJnpGgII3VMBkRH52j1uXiQwSRPDSlPDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejmciep4uEjDZzMlZey4PVSkLdwqVrlCt8FD6TqEWNzELEXl+RxvLseRNDZAESyP4HKg6NI9ovluYlffcfUE51HKhw2HrSBei1lz+yzTHE1XQI+azoU1T23J+vlIMypMP3J1xIvdmla0gjvQyPePHNwWA+Zai249tzcgzQxg2rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PcTlzEIn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PcTlzEIn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1BC4C2BCB2;
	Thu,  7 May 2026 18:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778179702;
	bh=uKezpq6CL6kJnpGgII3VMBkRH52j1uXiQwSRPDSlPDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PcTlzEInlPVzYtcAUp6d8CJ+SUuTLIFR/BwsqHCC5iEx57VAyWG7u7FrniQ83VbKf
	 6IO0JF6gM1SAQ0AwRwa9fnAKp33itH1tr4D+u3d0iROmS2HCQeGJEwpHZLpt/4jVWO
	 dNSuSOAE8/6osjI0osRGXdyevok07HxAxAffj5d2Lzx0VGbasuyOguDg+xbvKc7Ih8
	 1ESg38B8/CLp1diUwTGYh28ImNmMp+Olqs420n0vkZ1/KC8Pb7CKjcAsfW7Iu4Ex3s
	 vRhP9ZF1GqLBmM3U3lxwLdkbMkVi8aueP/IO22osAi+9RKfqvpqze2c366ioanv4Ys
	 lE4PMsYlDe5jw==
Date: Thu, 7 May 2026 13:48:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Konstantin Shabanov <mail@etehtsea.me>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: vendor-prefixes: Add HONOR
Message-ID: <177817969942.2241345.16070401299319825300.robh@kernel.org>
References: <20260501155612.5490-1-mail@etehtsea.me>
 <20260501155612.5490-2-mail@etehtsea.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501155612.5490-2-mail@etehtsea.me>


On Fri, 01 May 2026 22:56:09 +0700, Konstantin Shabanov wrote:
> Add vendor prefix for Honor Device Co., Ltd.
> Link: https://www.honor.com/
> 
> Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

