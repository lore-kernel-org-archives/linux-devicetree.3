Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE4A43CEE4
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 09:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778838350; cv=none; b=I5GbiaPFyPSSN8hRyR87eANQ64rEpXO1Vj9NRyuecoEFhqjlam7oJ6OPsL/zOhoCuPgyHx8oo1KYJ5pggjTyQlCxZ0P0fggG3Gpuau/6smrVzBoJQRB9VysKUtxROLIUTMYu5dLl+KKKgrhddOIjuKs07ydOjyr5b1Qy+dxcQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778838350; c=relaxed/simple;
	bh=FSWuoEUnf/U7vfjcCt1mGd3m3B90XdS5/2Wpn7JR6/E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U/iDi4BEl+S1GM25xsBUYLofc8Ongj95ThPIKwa40e7esa3xB5tRaWCoZoz6kf0EQuUXyatdla1ARYvyzrWPV0Vs5kkJWuOS0LmcXV+RgaMx1ev4zLLbivU5CLsWOHCnTGKNYFqksMwW+/GkQ26Z+Sds/Ti8UvDnndmscBXajyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k1oa36Qv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k1oa36Qv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4527CC2BCB0;
	Fri, 15 May 2026 09:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778838350;
	bh=FSWuoEUnf/U7vfjcCt1mGd3m3B90XdS5/2Wpn7JR6/E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=k1oa36Qvdz3xOe9mre8zAaBFy1t8BQoI+bIxC1gGU5m/ufWDo58gniRlMALaMYNhv
	 ZKYMedu1fxnRVakjWKAS7Q5Cyka47Lh8Slt/DVmC3wV6TvPgpvUFRhW+IHtIHmtoTj
	 cHP5RyoCJdUYpgHUTf6rvsM8pOY+5L3ubLCYpG8u9Eg5JKW9Mi0/+jlB6Z/diw9whK
	 Op9+0JvqbOlvqOMJhjZu6OJMThTdqoDBXte6jbQTQCNGdSzdo29fVnokSpXPJGTqTt
	 fGntovIIP6EEuTbPlvYF1SHqxpTou7vU+XxMpvEjbgZV1O5OVA13EWkrHWrS4sEQKe
	 vVG5JRittwK3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: thermal: tsens: add ipq5210 & ipq9650
 compatible
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com>
References: <20260515-tsens-yaml-v1-1-8039c62cc249@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 09:45:49 +0000
Message-Id: <20260515094550.4527CC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The newly added compatible strings `qcom,ipq5210-tsens` and `qco=
m,ipq9650-tsens` were omitted from the `allOf` conditional blocks that enfo=
rce constraints for 'v2 of TSENS with combined interrupt' variants.
--

commit 57dc4c24572b04937194d0201464e792021ddf2d
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible

This commit adds the compatible strings for the thermal sensors on the
ipq5210 and ipq9650.

> diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/=
Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> index 7d34ba00e684f..fd8031f7f6add 100644
> --- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> +++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
> @@ -89,9 +89,11 @@ properties:
> =20
>        - description: v2 of TSENS with combined interrupt
>          enum:
> +          - qcom,ipq5210-tsens
>            - qcom,ipq5332-tsens
>            - qcom,ipq5424-tsens
>            - qcom,ipq8074-tsens
> +          - qcom,ipq9650-tsens

Should these new compatible strings also be added to the allOf conditional
blocks later in the file that enforce constraints for the v2 TSENS variants
with combined interrupts?

If they are omitted from the if-then blocks that match the existing
compatibles, device trees using the new compatible strings might bypass
these rules and allow invalid configurations to silently pass schema
validation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260515-tsens-yaml=
-v1-1-8039c62cc249@oss.qualcomm.com?part=3D1
