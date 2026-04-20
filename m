Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABC0233BBCC;
	Mon, 20 Apr 2026 15:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776700240; cv=none; b=fyzcnflMjTdYhu4y7No+sJ3bBc80YxEoi+NKQ6z80mlSwbQ8AV9kcyE/vchlM19O2bR9rVaHJ3oBV+fcD263DJvpW1K6oECoijTewA/wvMoAjO/wSScQbCjbOu20in7fzkCLzgK+bnCGEqUsVeF2QUkTbRI3B7MwAuCBpiRkMjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776700240; c=relaxed/simple;
	bh=CLCPgkQgMRPGwrXuCFS2MSR57Ws93kW9/oM7ypStVGU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=toRMlwMTqt4OEjdhfiCpJClG+XkZPY03Am/SKcBaVjB+Sz2l3N2F6aYE+mjsh4YGTN5YBwwpuKPE1LFsgd8hoZ0rP62xqC+Bn83zmyH/FcSNlh40Ngdc9YUDBt+3ok9U6tRLUXepNR5fVwG6W/atnOoqzkz4Fgj89zwT201V0Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEqtQ-000000000qh-2HKA;
	Mon, 20 Apr 2026 15:50:36 +0000
Date: Mon, 20 Apr 2026 16:50:34 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: wire example style check into
 dt_binding_check
Message-ID: <30996f9ca58afada03ec62100c36e1d0566a4561.1776700167.git.daniel@makrotopia.org>
References: <cover.1776700167.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776700167.git.daniel@makrotopia.org>

Run dt-check-example-style as part of dt_binding_check_one to catch
formatting issues in DTS examples during schema validation.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 Documentation/devicetree/bindings/Makefile | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/Makefile b/Documentation/devicetree/bindings/Makefile
index 7b668f7fd4007..364d167e8dd27 100644
--- a/Documentation/devicetree/bindings/Makefile
+++ b/Documentation/devicetree/bindings/Makefile
@@ -46,6 +46,14 @@ quiet_cmd_chk_bindings = CHKDT   $(src)
 			  xargs -n200 -P$$(nproc) $(DT_DOC_CHECKER) -u $(src)) \
 			  && touch $@ || true
 
+DT_CHK_EX_STYLE = $(srctree)/scripts/dtc/dt-check-example-style
+
+quiet_cmd_chk_ex_style = STYLE   $(src)
+      cmd_chk_ex_style = ($(find_cmd) | \
+			  xargs -n200 -P$$(nproc) \
+			  $(PYTHON3) $(DT_CHK_EX_STYLE) --diff) \
+			  && touch $@ || true
+
 quiet_cmd_mk_schema = SCHEMA  $@
       cmd_mk_schema = f=$$(mktemp) ; \
                       $(find_all_cmd) > $$f ; \
@@ -62,13 +70,16 @@ override DTC_FLAGS := \
 $(obj)/processed-schema.json: $(DT_DOCS) check_dtschema_version FORCE
 	$(call if_changed,mk_schema)
 
-targets += .dt-binding.checked .yamllint.checked
+targets += .dt-binding.checked .yamllint.checked .dt-example-style.checked
 $(obj)/.yamllint.checked: $(DT_DOCS) $(src)/.yamllint FORCE
 	$(if $(DT_SCHEMA_LINT),$(call if_changed,yamllint),)
 
 $(obj)/.dt-binding.checked: $(DT_DOCS) FORCE
 	$(call if_changed,chk_bindings)
 
+$(obj)/.dt-example-style.checked: $(DT_DOCS) FORCE
+	$(call if_changed,chk_ex_style)
+
 always-y += processed-schema.json
 targets += $(patsubst $(obj)/%,%, $(CHK_DT_EXAMPLES))
 targets += $(patsubst $(obj)/%.dtb,%.dts, $(CHK_DT_EXAMPLES))
@@ -82,7 +93,7 @@ dt_compatible_check: $(obj)/processed-schema.json
 	$(Q)$(srctree)/scripts/dtc/dt-extract-compatibles $(srctree) | xargs dt-check-compatible -v -s $<
 
 PHONY += dt_binding_check_one
-dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked
+dt_binding_check_one: $(obj)/.dt-binding.checked $(obj)/.yamllint.checked $(obj)/.dt-example-style.checked
 
 PHONY += dt_binding_check
 dt_binding_check: dt_binding_check_one $(CHK_DT_EXAMPLES)
-- 
2.53.0
