Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010354;
	b=fSaNB8tpnOYcdvy6YvpYvCaRQfgBQPB+0mjvokcynt6dDXsUck1ntlH8j9DJHHXLfF+6
	 W6G52QE2H2hPNOrkUHnKA81HBVYiIHJ0Wyn7swgG5TlA7bnjngcT0GNr4ptoWdf5SSjAy
	 bBA6qUWBk4EAgoOs3j9uCbHFpSSMitwdNAPb+X6eGW4+dSWeVL02pvGHpQ1Y4sLMeUZH5
	 A4D5WS9sP6BiQQq/2yICcjha+1FI2W42YaPFdoxxx8pMhSkSD1S3rUZqVvDnCRgR+aL46
	 6eefIZShGFbzsRAW+Dn79TedXv0bbr339mUn/Yi/6YXaoDOFxpK6+tWgMkf4SO8e5Sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010354;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=iB9xRg9uWf/Pj4RoToWz7vb1MrtNd5AUe7Kc5lIIn8k=;
	b=oBhA0qXNxnidxBjhgtKzjhkgEAg8Ay+IbOlcWl5j19AOcwL1J0OPoKO+/e5TpZ4EnNmQ
	 luwVljOCJw/NBiIEzOkQRYS2I/g2yai1VK/dfG008eTqN4/EjmxRFcGfdNTTnfQF44JIm
	 UtiuHgSXhVhoDjl3wl6hcwJ/iBzCK5/mXiqutzC2EZc9H4JqqYzJH5gq+n27F2PrcqEBk
	 lJBJhUJosuNEWzAVdeHF9VquMDqy+z5ffpZJMNzV4mwSeqIqc3xlDlJiy/GSwKFCbDr2i
	 aqlWI39dirOYP+dHX8Q/rZ3gWcDWXTZ2RsxUQNjEGxOm2CxYRe8vCQSUn9pq6ka5ZbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnHNhYYE;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1097606A31C;
	Wed, 18 Nov 2026 13:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RnHNhYYE
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F180E1F000C4;
	Wed, 18 Nov 2026 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795010354;
	bh=iB9xRg9uWf/Pj4RoToWz7vb1MrtNd5AUe7Kc5lIIn8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RnHNhYYEhXYa8NJTlpQowkxmgW7FPtjt4wFj3HcoEu6PGmfwVbFhaZSIV8O1E1J5R
	 LcvldlZy2Q9Ydgol9DjivdyjEwSrzKu0KtBMgYGLtUsGGZwyJPAp1he+qAiYEs76I5
	 CfZkErfKo1EnW/tgcDH0hRnbQUARmqyLSal9B22xXRA+KdeM2nf3k/xUkKdrqNg/hW
	 EKYmnu7P6rb8Z7yMdG0Moc5CWjpAEJUb0IBWlx/De2kB1kvnW4dWVHHbMM68deRqKS
	 UpgzWQNjSgcS2YNmPgAlf5VUElCq0PrWGrG0gGJnDmEZmbY2ZDgt2F5/W4ssxxWrou
	 PBHn0iYzAyYUg==
Date: Wed, 18 Nov 2026 07:59:12 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dtc: dt-check-style: Check for closing bracket also on
 continued lines
Message-ID: <20261118135912.GA577511-robh@kernel.org>
References: <20261113183444.175773-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261113183444.175773-2-krzysztof.kozlowski@oss.qualcomm.com>

On Fri, Nov 13, 2026 at 07:34:45PM +0100, Krzysztof Kozlowski wrote:
> Fix incomplete check for closing brackets also for continued lines to
> flag code like:
>         reg = <0x100 0x10>,
>               <0x200 0x10>; }
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  scripts/dtc/dt-check-style                    | 19 +++++++++++--------
>  .../bad/yaml-multi-close.yaml                 | 13 +++++++++++++
>  .../expected/yaml-multi-close.yaml.txt        |  1 +
>  3 files changed, 25 insertions(+), 8 deletions(-)

Applied, thanks.
