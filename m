Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28063932EF;
	Thu, 26 Mar 2026 03:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495175; cv=none; b=fN8UPZFGkxBM4FCnIlDoDrrFTVp9cYaZknKdNJ/6gxM752m4DUCAmKMn9YI9rvD48M2pyjEgaoknW1M3B3XXkayvDaww0PfHLxl0DBSNr21pyVBo3T3OBVjh7EDfA1IRBCgu0Uy7kf0YQ3vBMaOqRdB0Tx4vPY3DbCPrS0nm3QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495175; c=relaxed/simple;
	bh=BIYxWY0MypFymISpdje/gZE750/SPCzLGSTXlPLhjZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FBcfweJwtjuY7LYi+2uV7mLuTaW7bQYLnvpBXNszSkjL/RNLvigKZpOrE7V7wkrf84eMSs8NJANqQLyFQeOvpVRIFo8VVY+Q6NJR+NQq20kaiIBQvPscu3/1bJycOiDtv6DYOlHBQeJIn7LLJNkZQHVXjwMMsgkHZZiiueIcmUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FSoSjXrh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FSoSjXrh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8972C4CEF7;
	Thu, 26 Mar 2026 03:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495175;
	bh=BIYxWY0MypFymISpdje/gZE750/SPCzLGSTXlPLhjZ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FSoSjXrhreBF9i5F/JJA+p12WKpnpyhPXWDQh+gu77M4AMtGMPpQjwHsv/4KJz50s
	 8VdGlCJX+HNCBlEOSFHF1eu8I003B8RFTUHxl50EH697Bmad8Q9k27iOok17kI9AKY
	 nQySYAIrXlVOpfUKGxU/UPbCSI2TryOe4qLTk2C7Rs2m/NPsYUU6RC0vWQslERKFXw
	 jAw2uW0bTDtn9u2+s5nLpM8HH5FeSwOE/jGAom9g2fZE1qT8wc2FxZG7Hx061hlRrZ
	 TTxVVGRbla+qgWxbE5DAXgGDA/JQtIfJ+OPJwCo1iE2gzKZj+8Kk0IPFQ140BTQVxz
	 p/8qJu5n9SS1w==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: patch mahua thermal zones by label
Date: Wed, 25 Mar 2026 22:19:17 -0500
Message-ID: <177449516616.60308.12279202845018940024.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
References: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 20 Mar 2026 04:51:00 +0200, Dmitry Baryshkov wrote:
> Updating DT nodes by the full path is fragile and frowned upon, it's
> easy to miss the rename of the node in the main tree. Add necessary
> labels and patch thermal zones for Mahua using those labels.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: patch mahua thermal zones by label
      commit: 282c1df469d0c0674785bd1427838c499807505b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
