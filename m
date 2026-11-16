Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839192;
	b=vb2uhWfFBatYtLB8Pntjappwk8IGS/w02fdAap5Z3TyCj9LVgsSDPeBdm42AokNtYcNe
	 LV9E3kyzjkjUd5+KSPYIFzWBZk47O6yovqcXUSLreiD9tfzR7vqGNTVpDKf/F5Ri7gerh
	 NInnAlB6avSdR9MPTycW9iSN65y5J603rNaOGhKXwg4WsPi1hITndtsLFLPXV9RiBBhfd
	 s9VToVLY79BLGeYminLeLqKjZethz+ra5Wg4O50DuAG3bDGTfTYvddpHZocSsJbyrU+LX
	 n80usPBr5nLGuVlwvIRE5nV5/niI5zXIv/RgGjv7R9C+Dn0ORiC0SwJ/yEmirKjMxgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839192;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=CNb+j4oVVMwkfoxuwNJmCWfjQ0Uyx4DdnWG9IhMbGRA=;
	b=LVd/SV2KSoMlkPhjFN7TferJBQECErV7OLNs1QtPOQzdyA4nIDMDOmKK8b20rCwycqZ6
	 xuyVhvn1E4HVDIcshjDTe6VT4ntEnI9o1lk4qe7n8jIvTGFfgDNfQm2GZWgTtP04W2qQk
	 jXLr2Z8oNDO60Ca/+521GSQX5D113WcjvikhWpKZqxrRN1gXxyDVzXC7WBXmld81/TPDW
	 Kqb6N9cpUT60Jz0KMjRqZkKDtgqY03H7diYRslG11mHas/woiCmfC/JHF6Zc0WwkGLX/0
	 D3YpdJE7JFKWpbI6OPvXEzVMmjjaq3BVqiPS3vgECQdZbNzuA9hQKrLM9gCVCxk6zzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFhWPDvg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JYO8Q7yS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8312606A330
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8312606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gFhWPDvg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JYO8Q7yS
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrV4f782431
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CNb+j4oVVMwkfoxuwNJmCWfjQ0Uyx4DdnWG9IhMbGRA=; b=gFhWPDvgZE5L1ZJ8
	dCvasLOUp7Ek/wpE+DHc/tgdKhf/0ZdBhvkHiZ3/9Q6XTIYyxDFeH+jZiDWrwTX2
	tfTr/Qvr9bNOvcYH6RmXoG73CQIwjcZM2G8Qc625z4i3PTeScglEGFyDPLILNgvq
	Hf8AUPRiIdIgtwMgGrAj0TnTAgLI+oY4lF6sIr20m8qEolgpvhhscAYOrd50klJX
	N24J/nLSRwwcGyHElZET0CWzT2jLWFEeRyNeIIMdg5OO67KoS3IhjlOD3QNtOr75
	Z+epdSD1nVIhPoNxpeH04WtF+P8XcNOIJJ3vrlskoJxc5KXdSjkIf5MF4ZTOqSWW
	QEvcHg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqggx3k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 14:26:30 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc450e6dc2so2750284137.2
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794839190; x=1795443990; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CNb+j4oVVMwkfoxuwNJmCWfjQ0Uyx4DdnWG9IhMbGRA=;
        b=JYO8Q7ySYsG02xu77zg/0bxzBHNxXqBF9UP6TnhXatU59R9g5h8hmzU929wKujrV0+
         qtz9m/7HeJr8FIRMo9atTFAikNtAd6DcQ4r9eCpS3MvkpWV0Biq1+nypkSRL/dfCQgi2
         gIRnxzXcQdqabKasGsm2YpCrBy5DNOxEuu6zZYIL4rqW4JQQZqNLEYKGdLXewP9ADz7X
         FK0X46AESzI3O/kNiigtKwq/aGWhXp6EBYsEjxfwHzsNL2X4lbBsdb64r1ClM9L5zlaN
         LarPsEpO8RHDGTLA3nTGa/F+LuTt+kankDXzciofohDMegyxiXzop0qocYdlTePqa0Mv
         PucQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794839190; x=1795443990;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CNb+j4oVVMwkfoxuwNJmCWfjQ0Uyx4DdnWG9IhMbGRA=;
        b=rOoa5DRm/k4HtbFFxSrbkPCZzKz5vpRl05OLmkh2cThuSEOuGCrkfyi66+Ri+KEsnY
         p8UiixbIgXp1pOfG0t1LMJ/AUNhLa1ieXrzEZAJtSFbR8l5kKyKgfSO9CwiQeSNSyLTl
         j7lo/5ajB7h2DdlNTsmVropwh9YvYQxG0zo5OOLU/8MZxSm4Vb59BWNcHzVEMO3wTA7f
         RrALSthvFfJZjlYhcearzmpiWYAcfzdeu/blHWb7BI295MrFMIaZc2Pp0OP/Fz98JUzK
         d7x00qBa4Fg52ZinrjZwg9xMJikpL36Q00qvM733b67mD5kP8uewVh/nA0/4TPvMZLo5
         oC9Q==
X-Forwarded-Encrypted: i=1; AL+hErHXfHeP4F5RA4FBLNXTOM5H6ps26CWxtpgg28YwLhgD8noKHLFUR4RUETsm/IO6hiKLHonwe48G1lPd@vger.kernel.org
X-Gm-Message-State: APuU4Z9zcQm7QK1QpVCJwRB6ZVpl3hjIt4/6Fe4ZEr501wYulxT06GfG
	nVHR1SCiVKO/SEcAhDp3x0jedWKP0QbX8ChQupS3O+B5fqN3peNu/1pHhfx621pmExtC+VVvV8r
	om62vnFOIIVu6sHLm4EF3ZGVgR4aVyGUnHcl6nE25NRYdDxYYYqDDGm5aDNvqObJr
X-Gm-Gg: AYBFou1LmrVw+8WniamyDp1FAKwzAVQmQ/iiTq3MxjyGiNx2B25BVHh3Wj8POvYWv9w
	bKwJ14tO6PNaUz5EP6LgdfjjdFB3YBpNlBsn5vNbtSYGlmhZcAE4fxJfM6KsgX4A7EK9YIibak4
	yoEd8NjceahDbo3EijmIGYefugDWyG3tD7oeCOEJi5EAVi8wnNkP56m7lJO1zIc6pdig8BPcoFK
	CdT+bxcioBdpc/64BqPbwqmGIaLn9RJUznUJ8ZR8qNRD0xuFCHTXNSt3gd0CadebAccNiX2rW5E
	ugUgqnGKLsgARVsvEgyhDdbqSGd7LRgUnOFWc3k6qrrUkF2k/QDamOcvJohmjgC1qlmQ3hVOEf9
	o/XRZenWMMBsaBMokvwyFOpTVv9yemvrpeU1g/lUJqOxR4iBwVsgVbSVuW2iaFwQ/FhsFL7jKNS
	EN
X-Received: by 2002:a05:6102:14a3:b0:7d0:6cf3:d8f3 with SMTP id ada2fe7eead31-7d64d77c0f0mr3812111137.18.1794839189671;
        Mon, 16 Nov 2026 06:26:29 -0800 (PST)
X-Received: by 2002:a05:6102:14a3:b0:7d0:6cf3:d8f3 with SMTP id ada2fe7eead31-7d64d77c0f0mr3812086137.18.1794839189120;
        Mon, 16 Nov 2026 06:26:29 -0800 (PST)
Received: from [172.20.97.26] ([195.50.164.66])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb4e29daa5sm405943255e9.12.2026.11.16.06.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 06:26:27 -0800 (PST)
Message-ID: <655212ed-4812-4747-ba5a-f0093bf05411@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:26:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: arduino-imola: probe the sound
 frontends first
To: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexey Klimov <alexey.klimov@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261114-imola-sound-link-order-v1-1-71d8bf1129b4@oss.qualcomm.com>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261114-imola-sound-link-order-v1-1-71d8bf1129b4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1NyBTYWx0ZWRfX7wL+5AtLMz71
 /8lfvT9XSupHsAIxbJ3vGjhjVnT3TS5N/aUzu1a8Rbfejg4sEcIJQn0fu8F4kv1VqmzXKifoJUA
 /yVLhEOXmUJNfLDUUk0yevkWIZh3opQ=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb1296 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vPr22jHWFOI-Apf3nKYA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: wbbbr1D4_k1uJqUrlTOT9wIzJM2jauJ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1NyBTYWx0ZWRfX8zr933dChoU8
 cWnsqapN5rUQI4iKLve8StqVHHd9NO4xNzlWh2WUV9mPeq3rkmrrXoTD2ZTItA4KQiFXSuI/bkE
 W4WTqwkNc3qttWKPrxFAG98C29MOw6urtRwYapK6Tpc54gkheglC57R3vLHxrDDdFB+ER0E9M1d
 ch7+eUx0NG3rZ5UnysBSoK2K0bVeDa5Ow6eIpeuYWIg0IsrKb2NYM2G3aEMufY7gn0yY6SRbNUG
 vVNbv98EfohUGfqna+jzwb/8SQvHbGC7ZSXfl470/TsYly48xF6YQ24tnJJFUq9Ldzba6l7GhnY
 D8ZLEMtuIf7IRv/Q/LAiZ37oxcpIA8f6EqCE8FwJpOTsiKEtpMeYPfmbT0JX/wapM5TE219pFpJ
 rE79A107d3lMu0sRnuJPL4idk6n5fSrh3IZwDmznUVglRHv4VcjNDXGXv+Iiomv+tFCvaIzpiQt
 8HkDTen2xlTpKjDH/6w==
X-Proofpoint-GUID: wbbbr1D4_k1uJqUrlTOT9wIzJM2jauJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160057

On 11/14/26 12:57 PM, Igor Opaniuk wrote:
> The card probes its components in DAI link order. With the codec DMA
> backends listed first, q6routing is probed before q6asm-dai, so its
> routes from the MM_DL and MM_UL widgets (created by q6asm-dai) cannot
> be added, the component probe fails and the card is not registered:
> 
>   q6routing ...: ASoC: Failed to add route MM_DL1(*) -> [MultiMedia1] -> HDMI Mixer
>   ...
>   snd-sm8250 sound: ASoC: failed to instantiate card -19
> 
> List the MultiMedia frontend links first, as the other qcom sound card
> device trees (RB5, RB2) do.
> 
> Tested on the Arduino UNO Q: the card registers and a tone plays on
> the headphone path (all 11 DAPM widgets powered).
> 
> Fixes: 61a95870e0f3 ("arm64: dts: qcom: arduino-imola: add support for sound")
> Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
> ---
> The UNO Q sound card from 61a95870e0f3 does not register as merged in
> arm64-for-7.5 (snd-sm8250 "failed to instantiate card -19"); with the
> MultiMedia links first it does.
> 
> The DTB differs from the current one only in the order of the dai-link
> nodes (and the phandle numbering that follows from it); dtbs_check is
> clean before and after.
> ---

Thanks Igor for the patch, but this is just start of the problem, Once
we apply overlays the nodes will be sorted once again and we are going
to hit the same issue.

can you please try this patch:

------------------------>cut<-----------------------------
From f9c336d90f1689c02ecd751c40e3f37379b6a690 Mon Sep 17 00:00:00 2001
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 22:21:22 +0100
Subject: [PATCH] ASoC: qcom: common: setup fe dais before be dais

qcom_snd_parse_of() registers DAI links in the devicetree order of
the sound{} child nodes. q6routing wires static routes such as

    "MM_DL1" -> "MultiMedia1" -> "HDMI Mixer"

which need the frontend (MultiMediaN) widgets to exist before the
backend widgets that reference them. This is a latent ordering
bug: any devicetree or overlay that lists a backend node before
its matching frontend trips it with

  q6routing ...routing: ASoC: Failed to add route MM_DL1(*) ->
[MultiMedia1] -> HDMI Mixer
  q6routing ...routing: ASoC: Failed to add route MM_DL2(*) ->
[MultiMedia2] -> HDMI Mixer
  ...

and today it is easily triggered just by reordering the sound{}
children, or by an overlay that appends a backend link.

Iterate the children twice, frontends (no codec child) first and
backends (codec child) after, so frontend PCM DAIs are always
registered before the backends. Per-node setup is moved into a
new qcom_snd_setup_dai_link() helper so both passes are identical;
cards where every child has a codec child (non-DPCM) hit only the
second pass and see no change.

Fixes: c25e295cd77b ("ASoC: qcom: Add support to parse common audio
device nodes")
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 182 ++++++++++++++++++++++++----------------
 1 file changed, 109 insertions(+), 73 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 83b745f617a8..4e0541c3db42 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -178,12 +178,104 @@ int qcom_snd_apply_dai_tdm_slots(struct
snd_soc_pcm_runtime *rtd)
 }
 EXPORT_SYMBOL_GPL(qcom_snd_apply_dai_tdm_slots);

+static int qcom_snd_setup_dai_link(struct snd_soc_card *card,
+				   struct snd_soc_dai_link *link,
+				   struct device_node *np)
+{
+	struct device *dev = card->dev;
+	struct snd_soc_dai_link_component *dlc;
+	struct of_phandle_args args;
+	int ret;
+
+	dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
+	if (!dlc)
+		return -ENOMEM;
+
+	link->cpus	= &dlc[0];
+	link->platforms	= &dlc[1];
+
+	link->num_cpus		= 1;
+	link->num_platforms	= 1;
+
+	ret = of_property_read_string(np, "link-name", &link->name);
+	if (ret) {
+		dev_err(dev, "error getting codec dai_link name\n");
+		return ret;
+	}
+
+	struct device_node *cpu __free(device_node) =
+		of_get_child_by_name(np, "cpu");
+	struct device_node *platform __free(device_node) =
+		of_get_child_by_name(np, "platform");
+	struct device_node *codec __free(device_node) =
+		of_get_child_by_name(np, "codec");
+
+	if (!cpu) {
+		dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
+		return -EINVAL;
+	}
+
+	ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
+	if (ret) {
+		dev_err_probe(dev, ret,
+			      "%s: error getting cpu dai name\n", link->name);
+		return ret;
+	}
+
+	link->id = args.args[0];
+
+	if (link->id >= LPASS_MAX_PORT) {
+		dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
+		return -EINVAL;
+	}
+
+	if (platform) {
+		link->platforms->of_node = of_parse_phandle(platform,
+				"sound-dai",
+				0);
+		if (!link->platforms->of_node) {
+			dev_err(dev, "%s: platform dai not found\n", link->name);
+			return -EINVAL;
+		}
+	} else {
+		link->platforms->of_node = link->cpus->of_node;
+	}
+
+	if (codec) {
+		ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
+		if (ret < 0) {
+			dev_err_probe(dev, ret,
+				      "%s: codec dai not found\n", link->name);
+			return ret;
+		}
+
+		if (platform) {
+			/* DPCM backend */
+			link->no_pcm = 1;
+			link->ignore_pmdown_time = 1;
+		}
+	} else {
+		/* DPCM frontend */
+		link->codecs	 = &snd_soc_dummy_dlc;
+		link->num_codecs = 1;
+		link->dynamic = 1;
+	}
+
+	if (platform || !codec) {
+		/* DPCM */
+		link->ignore_suspend = 1;
+		link->nonatomic = 1;
+	}
+
+	link->stream_name = link->name;
+
+	return 0;
+}
+
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
 	struct device *dev = card->dev;
 	struct snd_soc_dai_link *link;
-	struct of_phandle_args args;
-	struct snd_soc_dai_link_component *dlc;
 	int ret, num_links;

 	ret = snd_soc_of_parse_card_name(card, "model");
@@ -233,88 +325,32 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 	card->num_links = num_links;
 	link = card->dai_link;

+	/* Register frontends first so q6routing can resolve BE targets. */
 	for_each_available_child_of_node_scoped(dev->of_node, np) {
-		dlc = devm_kcalloc(dev, 2, sizeof(*dlc), GFP_KERNEL);
-		if (!dlc)
-			return -ENOMEM;
-
-		link->cpus	= &dlc[0];
-		link->platforms	= &dlc[1];
-
-		link->num_cpus		= 1;
-		link->num_platforms	= 1;
-
-		ret = of_property_read_string(np, "link-name", &link->name);
-		if (ret) {
-			dev_err(dev, "error getting codec dai_link name\n");
-			return ret;
-		}
-
-		struct device_node *cpu __free(device_node) =
-			of_get_child_by_name(np, "cpu");
-		struct device_node *platform __free(device_node) =
-			of_get_child_by_name(np, "platform");
 		struct device_node *codec __free(device_node) =
 			of_get_child_by_name(np, "codec");

-		if (!cpu) {
-			dev_err(dev, "%s: Can't find cpu DT node\n", link->name);
-			return -EINVAL;
-		}
+		if (codec)
+			continue;

-		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
-		if (ret) {
-			dev_err_probe(dev, ret,
-				      "%s: error getting cpu dai name\n", link->name);
+		ret = qcom_snd_setup_dai_link(card, link, np);
+		if (ret)
 			return ret;
-		}

-		link->id = args.args[0];
-
-		if (link->id >= LPASS_MAX_PORT) {
-			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
-			return -EINVAL;
-		}
-
-		if (platform) {
-			link->platforms->of_node = of_parse_phandle(platform,
-					"sound-dai",
-					0);
-			if (!link->platforms->of_node) {
-				dev_err(dev, "%s: platform dai not found\n", link->name);
-				return -EINVAL;
-			}
-		} else {
-			link->platforms->of_node = link->cpus->of_node;
-		}
+		link++;
+	}

-		if (codec) {
-			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
-			if (ret < 0) {
-				dev_err_probe(dev, ret,
-					      "%s: codec dai not found\n", link->name);
-				return ret;
-			}
+	for_each_available_child_of_node_scoped(dev->of_node, np) {
+		struct device_node *codec __free(device_node) =
+			of_get_child_by_name(np, "codec");

-			if (platform) {
-				/* DPCM backend */
-				link->no_pcm = 1;
-				link->ignore_pmdown_time = 1;
-			}
-		} else {
-			/* DPCM frontend */
-			link->codecs	 = &snd_soc_dummy_dlc;
-			link->num_codecs = 1;
-			link->dynamic = 1;
-		}
+		if (!codec)
+			continue;

-		if (platform || !codec) {
-			/* DPCM */
-			link->ignore_suspend = 1;
-			link->nonatomic = 1;
-		}
+		ret = qcom_snd_setup_dai_link(card, link, np);
+		if (ret)
+			return ret;

-		link->stream_name = link->name;
 		link++;
 	}

-- 
2.53.0

------------------------------->cut<--------------------------------


>  arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts | 47 +++++++++++-----------
>  1 file changed, 24 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> index e99d2a56dc28..3efd80f36c6c 100644
> --- a/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> +++ b/arch/arm64/boot/dts/qcom/qrb2210-arduino-imola.dts
> @@ -117,6 +117,30 @@ sound {
>  				"IN2_HPHR", "HPHR_OUT",
>  				"AMIC2", "MIC BIAS2";
>  
> +		mm1-dai-link {
> +			link-name = "MultiMedia1";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +			};
> +		};
> +
> +		mm2-dai-link {
> +			link-name = "MultiMedia2";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +			};
> +		};
> +
> +		mm3-dai-link {
> +			link-name = "MultiMedia3";
> +
> +			cpu {
> +				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +			};
> +		};
> +
>  		ear-playback-dai-link {
>  			link-name = "Ear Out Playback";
>  
> @@ -181,29 +205,6 @@ platform {
>  			};
>  		};
>  
> -		mm1-dai-link {
> -			link-name = "MultiMedia1";
> -
> -			cpu {
> -				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> -			};
> -		};
> -
> -		mm2-dai-link {
> -			link-name = "MultiMedia2";
> -
> -			cpu {
> -				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
> -			};
> -		};
> -
> -		mm3-dai-link {
> -			link-name = "MultiMedia3";
> -
> -			cpu {
> -				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
> -			};
> -		};
>  	};
>  
>  	vreg_anx_30: regulator-anx-30 {
> 
> ---
> base-commit: eac8f0411262ea7d156407da4baf260291cbfe32
> change-id: 20261114-imola-sound-link-order-15de4692e7ef
> 
> Best regards,

