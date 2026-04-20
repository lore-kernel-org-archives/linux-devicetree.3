Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE4C37F748
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776654738; cv=pass; b=JMc6RtRCasbn8tYfijLNXILEmNxqPxwhHHxxzFlTgadBbdSueFNNpGhCwGWqHzx4DhBoM12fF0nOxHrR8gTukzaTv6e4L9z+VjrtFVTX8FOeveeInyNHaW4XKDx+OVdDaMqSmTYKEDi5OntZQT0EHpKPzLUFA+EFhFYgKPY8X90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776654738; c=relaxed/simple;
	bh=qoDvN3WSHqVIC+6TizgCtqLmLAp2ikCtj1PxrE5Anb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Glq1vIgKVz+GrCdhk9ibGwppZlH7LCEiCxMYP3zDBrV/MoWV8Mlrh2R9K6c26KoHXqqDhG/NG17/zu+XKFx9qvNvAcOoTSNkrDJJwuuEgQ6/ykrZnUGMqMM+dnW3gL8hIIpfmd5hoZaj5Qzoq5y1f/aMkhKqnsywxcEXJljzuVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VYuPE5UB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBteTC7q; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VYuPE5UB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBteTC7q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63JMvi5F1475377
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:12:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iIpJhYwWUklQ7vfgGsge3mg/
	ZXlhfe7X8mN9MTgJ+gE=; b=VYuPE5UB8NJw/zGh0H7YAbDFj6YoMTU/VZKlf/GE
	uez5InlRGbViccqDOs8HEz6RS6F16L2rHL65QuKy19x/oGrIP499cvhwBnaSXFjM
	kmLAYZd212iJ3QXw8rthgCN9IEInvGKYsYRI92X6meSB03Dxo4i+SXWQtFtLCd62
	wUuyt1C/qG8JCnTSfep/1orU3w5cr6b7GdMTolPcJzVUel5xGI4NQ7ni9B/9HvOL
	jx+Vco75/hxAu0RFRZCOUPA+QGKKEDx0aMZCWF+qX+4f4MxKfDYWxIAbLOGH3ZcX
	5Zm50PhdXnOjv0CxyBDdXegmoGlTVWe1wPLPNGcpS9bGMQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm0wr3xpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 20 Apr 2026 03:12:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b24cd2e2b3so24566555ad.0
        for <devicetree@vger.kernel.org>; Sun, 19 Apr 2026 20:12:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776654736; cv=none;
        d=google.com; s=arc-20240605;
        b=lQSscK+DHKHzvQSog8GIxkwkqxfIwH0JLuo2NtgR/nA6mW/RDjGqB+HQ1kZoGYODmu
         GTVKVUhwNKN2lZHE//JZLzj84UbBB6i0rR9EqjTXNLqIkCDixE61+bO0Fdb6zl0znugG
         PN1FJhz5erID06ZtjzT37R6FS0lvXJTj8ibiIrcnNayYzMjxsN7sGJrZLA0gOxuhuYyy
         c5+4pj40hOw4RoqDnlhaxDuo3ipUa5/rexxVQSTuB9wadxPIywWonHIzFbJKQrKkMEQ7
         S7OXa23olmNunY5t8rKcGPq4vBKVIPllS8+LiQC9xGYYku8m6Tx5CyUvBu4rCKJiW4SL
         YgTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iIpJhYwWUklQ7vfgGsge3mg/ZXlhfe7X8mN9MTgJ+gE=;
        fh=pmn9QvPi0ZCSRxCpj2qU+x7M8HUFkSHS42jttnLNdHQ=;
        b=WwwSoTh7OcDefI6O+R3c6/rHqczCeSzPQ8Vuy8mIJ/3tCY/EEGKGL48/LPLNiQl2Qr
         iSVk0P2tDkEyzthAyoxo4v9hRwokVpsx08xXcN22EPBW8BXLC8Rh0K8oRTR+7MrEkDrS
         sRxkW2iU1NKPnKIznheDHfvkWmIeSpK0zWziifudQ104tDXQSQpzDpJLGL/aNiv0lJBP
         00RLnJ68NUGZ0iZ61MuDmJqjP/PN6+gn+XheLzm0JzljDODEZaa6GRahR+kkeFaiWd8P
         huyjksK/+h0vKur4S3rGep13iVGfj+8eCYC8/IVy+6yyeZIh7owQHzT+ElmHJXjoRrPB
         u2bA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776654736; x=1777259536; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iIpJhYwWUklQ7vfgGsge3mg/ZXlhfe7X8mN9MTgJ+gE=;
        b=ZBteTC7qWLwTXmVpsVmmnW5z3Z/jvADYea/ufpctq5VwW+6YHovRIbCSGh9WKHg4HK
         up+Gjgm4JB/VWAiml+rVbsp0iPE4t0gFxpKOImrFON2VUXl9Kq9mXH3rVf6LMGsARsai
         F4gT+5N7QB5ioHVKRt2XcbHJNB5yOJPtWaT1BrseUR7wQ6FceTxTiO3O1b2GAZjSOejE
         9DXBeFWGKUvS/mrtKAZsTgwM0RRQgXeAX0xcZmqH8k5aVtupJj6XJvB675VCVCACChGC
         nPdUgy3HYu/PIWcuUhyOSfCtcqCohju+YYKhtz4urq2M7kqKkt+hIKTaKAOht/NWqen7
         Ki/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776654736; x=1777259536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIpJhYwWUklQ7vfgGsge3mg/ZXlhfe7X8mN9MTgJ+gE=;
        b=eBBxp375Pn1gZL0Bm0sWBj71kz+3Ee3ioLigwzASl66tIC7IqEvYGYU+BegXuljJFO
         d/1950zy6i4gXEnm6x6QtpBsrLukjc6z11WEFioFYj5Ngx0LOXSkyEQW2tXSScMUpTzB
         Sd7ai7xq0RuERgkUv8i7FacrxMeidOatcgnYezY41aY8UVIDxXon059chXwGsWyH1sRm
         iczXAOG/TtiTTX9ZATgtXIFroi06gLTUloCuy1FrLLaSpl97j+nG8WiFPnnoliK/Eiol
         7QBE7vsfDLrguorUtKrzRhJfRwCDpXfu6NR919lp4CY3qJbzO/B2PfQrKuwmuwVQKUJ/
         7KVA==
X-Forwarded-Encrypted: i=1; AFNElJ9wXmdK4524MboM16m+qx6OTtj5r72AMryN3IDSsRZYEmNzNHsBGfrPjpFQVhvC407yQDqn/Z4Lac1w@vger.kernel.org
X-Gm-Message-State: AOJu0YzDP7BlKraY0+cs392dMC3G4M90D6ZnSazNsJxv/eivDy0iVFPG
	dcwxreBeK7ZzICojyKqfCR+ulhn2GlhSyY8Xa5bvp/XkUfnTppZ5AaAbQyZraajJN+rau78PtKP
	YVYnVC09NojtEE4ACqG51R0/alVsLHFFOITpO40QDQno0JYHOaedFsZiVdU6An7Ptn7t0cQBJ08
	edTPBYIAncEH0WclrbQuIapu3fgu+tfrbNR69KhjU=
X-Gm-Gg: AeBDiesx+0SuMYvh2kBvQKce8tA1XSOSQ+OGJH9jX82mvfwmSCFnDyFutOWIXfDGYd8
	2qgkMvEu9g0qYcHWoa8mJjChuJz8Xa0IbCK12Xw2Rv/OhLGIT+HSw8tN+BH5W7eLQMXVT6pOm5l
	QX9sUB7KIClUvdzGPeg1DIkkilXBH9gJvJ0sXyVYqWUUxQbslMx5XCWPq6PBf9QAWzmwrLxY7wn
	wloPsSNkX3NcvA=
X-Received: by 2002:a17:903:3905:b0:2b0:7e4d:f43f with SMTP id d9443c01a7336-2b5f9ffe73amr112670015ad.41.1776654735820;
        Sun, 19 Apr 2026 20:12:15 -0700 (PDT)
X-Received: by 2002:a17:903:3905:b0:2b0:7e4d:f43f with SMTP id
 d9443c01a7336-2b5f9ffe73amr112669635ad.41.1776654735266; Sun, 19 Apr 2026
 20:12:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260420023354.1192642-1-syyang@lontium.com> <20260420023354.1192642-2-syyang@lontium.com>
In-Reply-To: <20260420023354.1192642-2-syyang@lontium.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 20 Apr 2026 06:12:09 +0300
X-Gm-Features: AQROBzCSFGtiR6FT4_RuPPkrIrQ_huU99l3J_ksJ3m7ehGSiWAi3jzOQFLL_AXU
Message-ID: <CAO9ioeWhWemzyF30t8KDJht6_59b1Y5+GrH9nYCeKuPwddVLHQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings:bridge Add LT7911EXC binding
To: syyang@lontium.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org,
        maarten.lankhorst@linux.intel.com, rfoss@kernel.org,
        mripard@kernel.org, Laurent.pinchart@ideasonboard.com,
        tzimmermann@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        yangsunyun1993@gmail.com, xmzhu@lontium.corp-partner.google.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIwMDAyNyBTYWx0ZWRfX9q1yAWYZ0BdP
 +V1h055lyR8GTYc7LeO7GqR9FykHPCKwAJ5NxfEvB6xoBjtOvuyDXEOtVfv9o4wessok4K5J7i+
 hqa45ZUkH/oXMlcPQwod1RrOlpxE74Mo/VVnxp5uZj8RydrVF6L2IIvnaQb6mxjdp/4ZB7kbMiL
 pNf81nEdZNv2OYN4PTkdRH4e45o+Yx25DyVfnRraFl643E8n4TjDFrf1Dr5K8HabvgwO9aXY1Vr
 ihga1FxWdJRm//c5yZWkRRaxxdJocxqzkJgEFg1w01KY9rMnQNbJoKmAMnUkrQ62vxs7ZsHVR6T
 XdRs89Eba3LFDjF7sjwC9OJ4vTTvVlFLl4PRBua+sMwQmhJcI3ms1O8KLmbVhevRAlEF6qcFb/b
 BHZWf/94zTHvoz2bdiTK+CHdF0rGtwmX6n2733pbJhjtFFx/aIbdH9/OPjFKuqeN/6voxtJNiFJ
 WWVeQ0COUvA6g+CKpag==
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=69e59990 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8 a=Kz8-B0t5AAAA:8
 a=i0hb4mhT3AluH089dv8A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: QmInAv9BiSyPJCjpGvF1bJMN2HCdjcFP
X-Proofpoint-GUID: QmInAv9BiSyPJCjpGvF1bJMN2HCdjcFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-19_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604200027

ote, your message didn't reach dri-devel. Please check why. You might
need to switch to B4 Web relay submission, if there are any issues
with the SMTP on your side.

On Mon, 20 Apr 2026 at 05:34, <syyang@lontium.com> wrote:
>
> From: Sunyun Yang <syyang@lontium.com>
>
> -binding for lt7911exc.

Less is more, but here please settle for slightly more information
about the chip.

>
> Signed-off-by: Sunyun Yang <syyang@lontium.com>
> ---
>  .../display/bridge/lontium,lt7911exc.yaml     | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
> new file mode 100644
> index 000000000000..54a73d41635a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/lontium,lt7911exc.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/lontium,lt7911exc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Lontium LT7911EXC eDP to MIPI Bridge
> +
> +maintainers:
> +  - Sunyun Yang <syyang@lontium.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - lontium,lt7911exc
> +
> +  reg:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO connected to RST_ pin.
> +
> +  vdd-supply:
> +    description: Regulator for 1.2V MIPI phy power.
> +
> +  vcc-supply:
> +    description: Regulator for 3.3V IO power.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for mipi dsi output.

MIPI, DSI

> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Video port for eDP input.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - reset-gpios
> +  - vdd-supply
> +  - vcc-supply
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mipi-bridge@41 {
> +            compatible = "lontium,lt7911exc";
> +            reg = <0x41>;
> +            reset-gpios = <&gpy8 8 GPIO_ACTIVE_HIGH>;

Reset pins are usually active low.

> +            vdd-supply = <&lt7911exc_1v2>;
> +            vcc-supply = <&lt7911exc_3v3>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    bridge_out: endpoint {
> +                        remote-endpoint = <&panel_in>;
> +                    };
> +                };
> +
> +                port@1 {
> +                    reg = <1>;
> +
> +                    bridge_in: endpoint {
> +                        remote-endpoint = <&edp_out>;
> +                    };
> +                };
> +            };
> +        };
> +    };

-- 
With best wishes
Dmitry
