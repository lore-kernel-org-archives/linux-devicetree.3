Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5C939E178;
	Thu, 26 Mar 2026 03:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495187; cv=none; b=GkV2uDJfDyec/VpzsVlcLy2mvd1LzaOHvI8HVv4pqMAWfYVlhu2bRnPs743d2xkVZTU0Y6jXzEWJYYym7lxeV/364XfobMtdZELNFGJOqY4goERa6he8QCL1/P1hZlncObF6Zm1MNB3QaaYISH74qBipIyKkYCupcE0K/eG4/pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495187; c=relaxed/simple;
	bh=5BJkq7vb2+iXRV99aMmF1GtkaM5Wixv8vaAYo0T5e0g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=szRCmGuHaAryqtmUayZDezXzOlrDFLpUZSrn/2cpEHcPGsHxLaxweA2pGwpIl8PDKBsAvHU/1dkJlZeDzKY9kg+lGkscdUoTzGfA7nw3HJVUZyi6Fq3vdaxR9XmSzvDEBnL3mqjwRJa7teSAsxTTACdhW9y0X1Wp3VnbmMia75c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjzTdEPZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjzTdEPZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73E21C2BCB2;
	Thu, 26 Mar 2026 03:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774495186;
	bh=5BJkq7vb2+iXRV99aMmF1GtkaM5Wixv8vaAYo0T5e0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VjzTdEPZJIUDkIaYc/BbOHFEKWIypc3i84wxuw/xGmVLeym1IILl2OnWJuZboM5+4
	 Dx+u+x8hESQmx3SjfdGgSMofunuaQBR3lnCy0snP79XrHLM5rh1KpgBH7Q4r0TqYd6
	 kvbI0bduIbSG2fBWV0+UhxzW6OT6wcPp04tqde/4eVPg8z+9QkoxB5mA/6U/OBJQp3
	 6A3S9GqbxPvo7PBU199sabnZKUMlCNOeLiMUEvwXpcxxBAj6nnfY3XrpoXFFRM4NsB
	 0RI1kBuVr4qrj+F0Z8AaGZKUKVZzGUMqqLqePdbKFyTt72Mm8cSOZ3rcPw5of270A8
	 6SW1fpeUSqztg==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
	Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
	Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
	Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Misc BWMON fixes for glymur/mahua
Date: Wed, 25 Mar 2026 22:19:26 -0500
Message-ID: <177449516596.60308.17541233624252365720.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
References: <20260325-bwmon_fixes-v1-0-9433f9d4c276@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 25 Mar 2026 21:51:49 +0530, Pragnesh Papaniya wrote:
> This series adds the missing opp entry for Glymur/Mahua SoCs and deletes
> bwmon node that corresponds to non-existent cluster2 for Mahua SoCs.
> 
> 

Applied, thanks!

[1/2] arm64: dts: qcom: glymur: Add missing opp entry
      commit: 6921e10a808ab261974b5800e175b6e284b4ff6f
[2/2] arm64: dts: qcom: mahua: Fix mahua bwmon
      commit: 8e1f585aab4f044d49cf5147d89a6edaa90273c8

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
