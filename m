Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4943242B8
	for <devicetree@vger.kernel.org>; Thu,  2 Jul 2026 11:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782990477; cv=none; b=p0lS5W1p0Oyuk3kDfgIC5uHAmyMrFnQPxwOgJWXnvME4GHMNkmqe7qCTnmG0sHvChGTz+rVKOGmlNES+01hTelDk/9LamiRkxYTKTIdGT2VW59pPDv30xAgAQjd+CF6a0AHyQvazbnvIsSo0T23o/9ciwboVuXSBOTxM8wc7+UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782990477; c=relaxed/simple;
	bh=o1m9M/JFUfT7TSuGV5Bt1WSxNIWjFLdXG8UFWA7w0BE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PG25biMhvpD2vMlsiaZ6pL/b/g0RxyiBvOgu0mUx7YrArViW3bvy29CHPjNyhb2ijAxcQD0I6XRxEYN7m8kRRL94sSURrfIoFB4uTdqAMRHLg8VU5KUykSA17g5r+U+13pJfV1TZ4K/DI/dwYxL5cdZcg2u6iHt1VAF5rdZeMj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ShHdLked; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ShHdLked"
Date: Thu, 2 Jul 2026 14:07:39 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782990474; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type; bh=9ogwjo3FQNfPyMRSaQH/cxCQyqF4UEQyAc9VNNI+d8c=;
	b=ShHdLkedRMq+cKgV2KZnaoSGDbk0kdZ00QQa6Bv9wv6Y7uNotJNaDJjO4loWaqWmqV0mA4
	kkz+vTMBxtBVIQPXkysUqKODiFKkkvLKQlImIqovUuRYEa1e9kCugeuwX4Tc2k76s4U2mq
	KdIQy0ZyA13/vg81r7itPlkgC1VAS5c=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Matti Vaittinen <matti.vaittinen@linux.dev>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: regulator: ROHM PMIC state-machine voltages
Message-ID: <akZGe1CaQFDd3idm@mva-rohm>
Reply-To: Matti Vaittinen <mazziesaccount@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tO1kyZ9j32SlCKKJ"
Content-Disposition: inline
X-Migadu-Flow: FLOW_OUT


--tO1kyZ9j32SlCKKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

=46rom: Matti Vaittinen <mazziesaccount@gmail.com>

A few of the ROHM PMICs have a state-machine corrsponding to the SOC
power-states. Idea is that by changing the PMIC state, all power-outputs
will be switched to a pre-defined state. As an example, the SOC may use
a low-power state when system is suspended, and when transitioning  from
the normal operation to suspend, the PMIC can be told to go to
SUSPEND-state - which will then switch outputs of all power-rails to
pre-defined low-power state matching the SOC expectation for SUSPEND.
In addition to the SUSPEND, there are a few other states as well.

The voltage values & enable / disable -states matching the SOC
expectations can be set for the PMIC states using
rohm,dvs-<state>-voltage -properties. It all started with the BD71837
supporting this, but over the years these same properties have been used
for a few other PMICs, and seems like this HW-state machine design is not
going away.

Copying the descriptions and types in each PMIC specific binding, and
discussing them during the reviews is getting tedious for the reviewers
and author(s) alike. Furthermore, having separate descriptions makes it
very easy to add errors, or differing, and even contradicting
documentation for properties with same name.

Avoid these issues by using one common file for the common ROHM PMIC
state-machine definitions and only referencing this from the individual
PMIC bindings.

Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
Suggested-by: Rob Herring <robh@kernel.org>

---
This was discussed briefly here:
https://lore.kernel.org/all/20260701192559.GA1313239-robh@kernel.org/

I will send this separately from the BD73900 -series to keep the series
a bit smaller and to allow this to get merged independently. I can
however send the further revisions in the BD73900 -series if that's
preferred by reviewers.
---
 .../regulator/rohm,bd71815-regulator.yaml     | 27 +++------
 .../regulator/rohm,bd71828-regulator.yaml     | 20 +------
 .../regulator/rohm,bd71837-regulator.yaml     | 16 +-----
 .../regulator/rohm,bd71847-regulator.yaml     | 16 +-----
 .../regulator/rohm,bd72720-regulator.yaml     | 40 ++-----------
 .../bindings/regulator/rohm,pmic-states.yaml  | 57 +++++++++++++++++++
 6 files changed, 79 insertions(+), 97 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,pmic-s=
tates.yaml

diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regula=
tor.yaml
index cc4ceb32e9d6..68b5e579e2d3 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71815-regulator.ya=
ml
@@ -38,7 +38,9 @@ patternProperties:
     type: object
     description:
       Properties for single LDO/BUCK regulator.
-    $ref: regulator.yaml#
+    allOf:
+      - $ref: regulator.yaml#
+      - $ref: rohm,pmic-states.yaml#
=20
     properties:
       regulator-name:
@@ -51,15 +53,6 @@ patternProperties:
         description:
           GPIO used to control ldo4 state (when ldo4 is controlled by GPIO=
).
=20
-      rohm,dvs-run-voltage:
-        description:
-          PMIC "RUN" state voltage in uV when PMIC HW states are used. See
-          comments below for bucks/LDOs which support this. 0 means
-          regulator should be disabled at RUN state.
-        $ref: /schemas/types.yaml#/definitions/uint32
-        minimum: 0
-        maximum: 3300000
-
       rohm,dvs-snvs-voltage:
         description:
           Whether to keep regulator enabled at "SNVS" state or not.
@@ -71,21 +64,15 @@ patternProperties:
         minimum: 0
         maximum: 3300000
=20
+      rohm,dvs-run-voltage:
+        minimum: 0
+        maximum: 3300000
+
       rohm,dvs-suspend-voltage:
-        description:
-          PMIC "SUSPEND" state voltage in uV when PMIC HW states are used.=
 See
-          comments below for bucks/LDOs which support this. 0 means
-          regulator should be disabled at SUSPEND state.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-lpsr-voltage:
-        description:
-          PMIC "LPSR" state voltage in uV when PMIC HW states are used. See
-          comments below for bucks/LDOs which support this. 0 means
-          regulator should be disabled at LPSR state.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regula=
tor.yaml
index d898800d6bca..8cba397678a6 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71828-regulator.ya=
ml
@@ -40,7 +40,9 @@ patternProperties:
     type: object
     description:
       Properties for single BUCK regulator.
-    $ref: regulator.yaml#
+    allOf:
+      - $ref: regulator.yaml#
+      - $ref: rohm,pmic-states.yaml#
=20
     properties:
       regulator-name:
@@ -49,34 +51,18 @@ patternProperties:
           should be "buck1", ..., "buck7"
=20
       rohm,dvs-run-voltage:
-        description:
-          PMIC default "RUN" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-idle-voltage:
-        description:
-          PMIC default "IDLE" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-suspend-voltage:
-        description:
-          PMIC default "SUSPEND" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-lpsr-voltage:
-        description:
-          PMIC default "LPSR" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regula=
tor.yaml
index 29b350a4f88a..efb38dd15145 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71837-regulator.ya=
ml
@@ -44,7 +44,9 @@ patternProperties:
=20
   "^BUCK[1-8]$":
     type: object
-    $ref: regulator.yaml#
+    allOf:
+      - $ref: regulator.yaml#
+      - $ref: rohm,pmic-states.yaml#
     description:
       Properties for single BUCK regulator.
=20
@@ -55,28 +57,16 @@ patternProperties:
           should be "buck1", ..., "buck8"
=20
       rohm,dvs-run-voltage:
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1300000
-        description:
-          PMIC default "RUN" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
=20
       rohm,dvs-idle-voltage:
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1300000
-        description:
-          PMIC default "IDLE" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
=20
       rohm,dvs-suspend-voltage:
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1300000
-        description:
-          PMIC default "SUSPEND" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
=20
         # Supported default DVS states:
         #
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regula=
tor.yaml
index 7ba4ccf723d8..ef6f69be24ae 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd71847-regulator.ya=
ml
@@ -43,7 +43,9 @@ patternProperties:
=20
   "^BUCK[1-6]$":
     type: object
-    $ref: regulator.yaml#
+    allOf:
+      - $ref: regulator.yaml#
+      - $ref: rohm,pmic-states.yaml#
     description:
       Properties for single BUCK regulator.
=20
@@ -54,28 +56,16 @@ patternProperties:
           should be "buck1", ..., "buck6"
=20
       rohm,dvs-run-voltage:
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1300000
-        description:
-          PMIC default "RUN" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
=20
       rohm,dvs-idle-voltage:
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1300000
-        description:
-          PMIC default "IDLE" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
=20
       rohm,dvs-suspend-voltage:
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 1300000
-        description:
-          PMIC default "SUSPEND" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
=20
         # Supported default DVS states:
         #
diff --git a/Documentation/devicetree/bindings/regulator/rohm,bd72720-regul=
ator.yaml b/Documentation/devicetree/bindings/regulator/rohm,bd72720-regula=
tor.yaml
index 5518082129bd..76747bf2bbdd 100644
--- a/Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.ya=
ml
+++ b/Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.ya=
ml
@@ -26,41 +26,27 @@ patternProperties:
     type: object
     description:
       Properties for single LDO regulator.
-    $ref: regulator.yaml#
+    allOf:
+      - $ref: regulator.yaml#
+      - $ref: rohm,pmic-states.yaml#
=20
     properties:
       regulator-name:
         pattern: "^ldo([1-9]|1[0-1])$"
=20
       rohm,dvs-run-voltage:
-        description:
-          PMIC default "RUN" state voltage in uV. See below table for
-          LDOs which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-idle-voltage:
-        description:
-          PMIC default "IDLE" state voltage in uV. See below table for
-          LDOs which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-suspend-voltage:
-        description:
-          PMIC default "SUSPEND" state voltage in uV. See below table for
-          LDOs which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-lpsr-voltage:
-        description:
-          PMIC default "deep-idle" state voltage in uV. See below table for
-          LDOs which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
@@ -82,7 +68,9 @@ patternProperties:
     type: object
     description:
       Properties for single BUCK regulator.
-    $ref: regulator.yaml#
+    allOf:
+      - $ref: regulator.yaml#
+      - $ref: rohm,pmic-states.yaml#
=20
     properties:
       regulator-name:
@@ -97,34 +85,18 @@ patternProperties:
         maximum: 300000
=20
       rohm,dvs-run-voltage:
-        description:
-          PMIC default "RUN" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-idle-voltage:
-        description:
-          PMIC default "IDLE" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-suspend-voltage:
-        description:
-          PMIC default "SUSPEND" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
       rohm,dvs-lpsr-voltage:
-        description:
-          PMIC default "deep-idle" state voltage in uV. See below table for
-          bucks which support this. 0 means disabled.
-        $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 3300000
=20
diff --git a/Documentation/devicetree/bindings/regulator/rohm,pmic-states.y=
aml b/Documentation/devicetree/bindings/regulator/rohm,pmic-states.yaml
new file mode 100644
index 000000000000..f09f021bdde4
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/rohm,pmic-states.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/rohm,pmic-states.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ROHM PMICs' hardware state machine descriptions
+
+maintainers:
+  - Matti Vaittinen <mazziesaccount@gmail.com>
+
+description:
+  Many of the ROHM PMICs have internal state-machine designed to provide
+  correct voltages for different SOC states. In many cases the states and
+  transitions are SOC specific, but ones described here can be found from a
+  few of the different ROHM PMICs.
+
+properties:
+  rohm,dvs-run-voltage:
+    description:
+      PMIC "RUN" state voltage in uV when PMIC HW states are used. 0 means=
 the
+      regulator should be disabled at RUN state. Some regulators do not su=
pport
+      setting HW state specific voltage but do support enable/disable cont=
rol.
+      For them any positive value means the regulator should be enabled wi=
thout
+      touching the voltage.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  rohm,dvs-suspend-voltage:
+    description:
+      PMIC "SUSPEND" state voltage in uV when PMIC HW states are used. 0 m=
eans
+      the regulator should be disabled at SUSPEND state. Some regulators d=
o not
+      support setting HW state specific voltage but do support enable/disa=
ble
+      control. For them any positive value means the regulator should be
+      enabled without touching the voltage.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  rohm,dvs-idle-voltage:
+    description:
+      PMIC "IDLE" state voltage in uV. 0 means the regulator should be dis=
abled
+      at IDLE state. Some regulators do not support setting HW state speci=
fic
+      voltage but do support enable/disable control. For them any positive
+      value means the regulator should be enabled without touching the vol=
tage.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+  rohm,dvs-lpsr-voltage:
+    description:
+      PMIC "LPSR" state voltage in uV when PMIC HW states are used. 0 mean=
s the
+      regulator should be disabled at LPSR state. Some regulators do not
+      support setting HW state specific voltage but do support enable/disa=
ble
+      control. For them any positive value means the regulator should be
+      enabled without touching the voltage. Some PMICs' documentation may =
refer
+      to this state as a "deep-idle state".
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+# The schema is expected to be reference by PMIC schemas, which may introd=
uce
+# other properties that must be allowed.
+additionalProperties: true

base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
--=20
2.54.0


--tO1kyZ9j32SlCKKJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEIx+f8wZb28fLKEhTeFA3/03aocUFAmpGRncACgkQeFA3/03a
ocV8iggAtwCuOvNIqSM7BHg3Sw6/kJZjDCMrw3+VBnA8Z/FCobClDUct6DR/IQvE
rDSkB+pUrsx9r1QzNz8iLoCaeJiMzpV780SgPPUErAfpub9KKM0sJ1gReHg18p8s
ZbN+nUdUw3cKcPBZzUQpIR3uRbQ0ZIXEbbCZMI4JR9EhkiHyhl51cUEzhpWX3mMh
gomSe5J9KwsG+I9KZn91st6dqe0i7g/S2BtzhzJdE7gbDq1dIxc4p+BrGIlV0CV4
yrCch55JEvauwPPPz29m5824hTKcZRT1wDRDQL1uGEX7iWFJ4ZHPg34AUrwL6BTo
PNx3ltP3G9JNCgKpwWIlw6Zz3lHTnA==
=5FDZ
-----END PGP SIGNATURE-----

--tO1kyZ9j32SlCKKJ--
