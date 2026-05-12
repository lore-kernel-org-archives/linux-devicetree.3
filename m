Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FA32E62A9
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622389; cv=none; b=jYXvjD93ibyvgO0M3IOy7JbpGp4bvzuSZPuXtvEYZUStOkdomw8xKJOVVhKcpsN5muSGO2PnB/DUZ+OIg6gm1KNTXuO7onePmV9/9fhH9LRV81hmdyGSJ4zoiGuzlUiyCS0TSTlMFIoy6SLE7avSaIZNHI/BLJ0fdKEGmqZ9SkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622389; c=relaxed/simple;
	bh=snTpyrNf4tFcXrbLHZCMPFZ+Yug/ERkjC1uvYdZWL+g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YuWNb3sexFbi8y9YW+8FPRr9Blajf1+Dv64Tsv8FFhw6YcVhJqP0A3YUcp85ikRUi+8OAM0c96E1IABgRVLN/miiENJxoO3BB4lX1d2CC/LJTAMq20oFTZ4shnLJ7gKKbBYLT73dJDDCmy/e/3FYYxb4oboxWYV8MsJ6N/7GKvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cO4VoEFw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cO4VoEFw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB578C2BCB0;
	Tue, 12 May 2026 21:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778622389;
	bh=snTpyrNf4tFcXrbLHZCMPFZ+Yug/ERkjC1uvYdZWL+g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=cO4VoEFwlcyp7TeZzsjGwS5U64FFYempXMnbMduNw9K68uMo7cu9Nnkd4mt/fQ+uh
	 DOSHCG2S99oVKxln1DuV0aaa4PFIUqH2de5HNJjJwrLwGVgM1lsBufRQQaMZm82Zhm
	 m3Wa90gA/H8g1n7VatMPl5oCNyWSM6v+WOBnRBJEDQZE930Pa1Fr4xVYTrt1ZOKQ8f
	 ZFZBisbTeR9kjTKXcP550Q4FrqiJ8TsNlH34TR8MxWCLgujGEF0njNSyhEM8MFMWsd
	 DGzcUi0jidwH+3tLtOVa385mDwZjYKqyyi/FcuZQFoES0uHTWrPwzvBUqlE7NO+hpX
	 c/XPXOq2maTDg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 16/18] ACPI: RISC-V: Parse RISC-V Quality of
 Service Controller (RQSC) table
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-16-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-16-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 21:46:28 +0000
Message-Id: <20260512214628.EB578C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The parser ignores the `rqsc->num` field and may fail fatally on v=
alid tables with trailing padding.
- [High] Unvalidated resource descriptor types may lead to misinterpretatio=
n of resource data.
- [High] The parser ignores `node->flags`, risking access to disabled or po=
wered-down hardware.
- [High] Hardcoded resource subtable offsets create forward compatibility r=
isks due to missing revision checks.
- [Medium] Missing validation of node `length` against the table boundary a=
llows silent acceptance of corrupted tables.
--

commit 163a54a89d0b05cc3754e1a635d0dc2d8cbb9e84
Author: Drew Fustini <fustini@kernel.org>

ACPI: RISC-V: Parse RISC-V Quality of Service Controller (RQSC) table

Add a parser for the ACPI RQSC table, which describes the CBQRI
controllers in a system. For each table entry, populate a
cbqri_controller_info descriptor and hand it to the CBQRI driver via
riscv_cbqri_register_controller().

Link: https://github.com/riscv-non-isa/riscv-rqsc/blob/main/src/
Link: https://github.com/riscv-non-isa/riscv-cbqri/releases/tag/v1.0

> diff --git a/drivers/acpi/riscv/rqsc.c b/drivers/acpi/riscv/rqsc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/acpi/riscv/rqsc.c
[ ... ]
> +	for (node =3D ACPI_ADD_PTR(struct acpi_rqsc_node, rqsc,
> +				 sizeof(struct acpi_table_rqsc));
> +	     node < end;
> +	     node =3D ACPI_ADD_PTR(struct acpi_rqsc_node, node, node->length)
> +	) {
> +		const struct acpi_rqsc_resource *res0;
> +		struct cbqri_controller_info info =3D {};
> +		int ret;
> +
> +		if ((void *)node + sizeof(*node) > (void *)end) {
> +			pr_err("truncated entry at end of table, aborting\n");
> +			riscv_cbqri_unregister_last(num_controllers);
> +			return -EINVAL;
> +		}

Does this code also need to verify that the entire declared length of the n=
ode
fits within the table boundary?

If a malformed node declares a length extending beyond the end of the ACPI
table, the node pointer could advance past end during the loop increment:

    node =3D ACPI_ADD_PTR(struct acpi_rqsc_node, node, node->length)

Could this cleanly fail the loop condition on the next iteration and silent=
ly
return success instead of rejecting the corrupted table?

> +
> +		if (node->length < sizeof(*node)) {
> +			pr_err("malformed RQSC entry: length %u < %zu, aborting\n",
> +			       node->length, sizeof(*node));
> +			riscv_cbqri_unregister_last(num_controllers);
> +			return -EINVAL;
> +		}

Could this loop be bounded by rqsc->num instead of just node < end?

If the firmware pads the table at the end for alignment, the parser might
attempt to process the zeroed padding as a node.

Would encountering this padding trigger this length check, unregister all
successfully parsed controllers, and completely abort initialization for an
otherwise valid table?

> +
> +		/* GAS must describe system memory. ioremap() consumes it later. */
> +		if (node->reg.space_id !=3D ACPI_ADR_SPACE_SYSTEM_MEMORY) {
> +			pr_warn("controller has unsupported address space_id=3D%u, skipping\n=
",
> +				node->reg.space_id);
> +			continue;
> +		}

Should this code check node->flags before proceeding? Standard ACPI practice
typically uses Bit 0 to indicate whether a hardware block is present and
enabled.

If flags are ignored, could the driver risk mapping and accessing
memory-mapped registers of explicitly disabled hardware?

[ ... ]
> +		/*
> +		 * Resources follow the node header in-line. Only res[0] is
> +		 * consumed. Bound it against end before reading its prefix so
> +		 * a table that ends partway through a resource subtable is
> +		 * rejected rather than read past the mapping.
> +		 */
> +		res0 =3D (const struct acpi_rqsc_resource *)
> +		       ((const u8 *)node + sizeof(*node));

Is it safe to hardcode the start of the resource subtables using
sizeof(*node)?

If a future revision of the RQSC table extends the acpi_rqsc_node structure
with additional fields, sizeof(*node) would be smaller than the actual
node header size.

Could this missing rqsc->header.revision check cause the parser to point in=
to
the middle of the new header fields and incorrectly interpret them as the
first resource descriptor?

[ ... ]
> +		/*
> +		 * id1 is u64 on the wire but cache_id and prox_dom are u32
> +		 * downstream (PPTT cache_id, ACPI proximity domain). Reject
> +		 * rather than truncate, so a too-large id is not silently
> +		 * mapped to the wrong PPTT entry or NUMA node.
> +		 */
> +		if (res0->id1 > U32_MAX) {
> +			pr_warn("controller at %pa: id1 0x%llx exceeds u32, skipping\n",
> +				&info.addr, res0->id1);
> +			continue;
> +		}
> +
> +		switch (info.type) {
> +		case CBQRI_CONTROLLER_TYPE_CAPACITY:
> +			info.cache_id =3D (u32)res0->id1;
> +			break;
> +		case CBQRI_CONTROLLER_TYPE_BANDWIDTH:
> +			info.prox_dom =3D (u32)res0->id1;
> +			break;

Does this code need to validate the type and id_type fields of the resource
descriptor before extracting res0->id1?

If a controller specifies multiple resources (node->nres > 1) and the first
descriptor is not the expected cache ID or proximity domain, could the
parser blindly misinterpret its contents?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D16
