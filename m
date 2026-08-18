Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49038445ADD
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045251; cv=none; b=oXTIOZcKQiggn8iz0CeRX8FWMldFzvwHR0lhoDibnU/e8SruE130ngZ3tgeyI+ywXXG/6jPnzmw9Ni7QfWfV9qTKakv4hnhsLqd5g0upA4Pg2CFKg2qN2Np3rukkfmKdi3Qe1+pRFxSFogyh/96JijHFByhHMlHclKT33M3SgsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045251; c=relaxed/simple;
	bh=amz+vd1diC7SjsMF0CAr8AEkOtXBF3jHF9d71+xyfnE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MKGMGL942HvV0EcKy8pXHQrggj1EjDazMnUTRcJfYxklSZyofIwjNoOdDv+iYVfdYp844a23knXRNRB0fEIuZjrWs9My/4Yp8hDRayUAsUC+Fd8vWOvPufbHhHO/zeIRB04hyAOxz7ooEIURqJNiJvEpCZ2Tgu44Tc8o8nNzeX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEupP9CI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jzHTtoV1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEupP9CI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jzHTtoV1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BGEF747691
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aQd6s7bdoRTyRzo99H5RBvALbnAO1zN/knQk47ZLTgw=; b=gEupP9CIT/Vr1ler
	9PZ78u6/C6hyZS9d99MFVrwSwy6fE/CRO5ykcV9q1QSPGkrsAdqS7qph0pk9qnnx
	y9I/nZQVM+iM98ycnLwzgMPN2qxSyAZzR/ZQ35t7R7XKss0mH5zHmnxJmtzUHpme
	yDpYry6amKhePX4znscR1+vbcZ3aZJI1nG9kxglLZbjo0YqbbGoCDsvDa4N5XlSm
	jIdEECJMezyIXxAUfjaJHciC0OtpObMzRKN5lKrcKTDVzKoAdg9/PgbMJaU6pS6d
	Kcrh8WC0l/vYy+AjJQqGsmmuz1HkmD4ldtblNvNRHHDHnD5yHIaTmPKTBo8gfrhC
	0iOVUg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g48q0tymx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 09:27:29 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934a8cd3a8bso44864885a.3
        for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 02:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787045249; x=1787650049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQd6s7bdoRTyRzo99H5RBvALbnAO1zN/knQk47ZLTgw=;
        b=jzHTtoV1rVzTjkm57VoN8v8jTfdQMtuUZNbFmbmK2zML+J0E4RI2fL2zjnHzdMGmiv
         oGtIgXeArtQb7+YQkEmlwGMvAdsy4puc9JqML0iQktP5pGCKZJD2WEOL6wgj2cUC3Ixo
         6ZRoCSITW388WWVk3oVm/Rj+RH+oztt8tmPUcgcLaJoqh9D4iB1DaPlEs0vRgNA9OsQE
         fyYsiv2nJBwEA/1bZkUlGdjN5CC1/OjBmc0MiA1FBbAjKt7kPfpQaJ+x0lgHp9bARigC
         /GIoWD+h80PtOwydAkZTj2WXqPBrHgvAnnGBZ90HcjrR3JNfr38wEXTOz6JKfJ3qbutS
         XqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045249; x=1787650049;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQd6s7bdoRTyRzo99H5RBvALbnAO1zN/knQk47ZLTgw=;
        b=cCLOU1zgGNAsvEA4wcJMpfvTFeD91jEu9451nAABWifG0UYSe62rJ9Qx75KFd+HJxJ
         BzkjMV25Z9/KAhjEFIdmiiA0jtxs4LsZVRDh9UHjhEsU5AIV5pYrnrCzgnwe/E31LSZH
         MbQUoLkEzDaMBU7ufC20O1orYhKEW/E3+yYm8kVC90S4Ay3Exm7jTbSNpPWPD/b6ZpGE
         3zEYNpJnaPsoTWZzoNN6+2AMQPmtoR8J+eSnKnFmWIIMj91L1Yok+Dvkcf7TdpbeEKR+
         LF2hf5ggqH0P8mGdj+/mWflUj8I+32ALfIdh2fuso3rVRl2qPw+JTZgbM3y3hOoHmqi7
         +7/Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp2eWPG8CwdjMcSmRrUjMytpZWyBRzz2PCup7g9KoqOdZa1NDPzop/wk+OaiGodxE/KNuDJfeu2tMp3@vger.kernel.org
X-Gm-Message-State: AOJu0YweTJTh8LbMNyJQct4chRPYRPDkF6mmwy66QaV5FDviknK6F8Ej
	xQXVCZPFKpSE0rb/w4tdKXMwg3glzPL76yAEGnnaLJOrYOT9u7naJfhyZ4dnvqa95qPZHIj1Gz4
	fiDtKek8womubtoH38PxMjni6h2sqUMfgfRoiappHgrNZJ0q3km8FSnZ+ddlv6C4V
X-Gm-Gg: AR+sD12aecOgEmYbV27we+1TwALCiB1Q3lgbHMsduIDA1VeB5grXw4kfVJ3laEIPvas
	3PN604Z3TjReyZvPNa1VlpxwC3TD3Zkv/XVIJRlmylO2IhOldMcyux+Gpb5ZWmWF1dn4UEYIWtL
	le03+kpeHiLfRTWb277ctgO8b6kwnhYGI8WOzn57Dliy8Oc7nzAgSrAclbvuAQCSA9LI+/zwub5
	0og3E7gFXraXM1zDa2yb4biNZGoHykhcNJATVv+1FR7EOy/GTwsmZ/8gdA2vVpVV8qOIDEC9RSX
	VxPl+tTGABRnquXJ4Cv1KCTjO7e4suKNDXopYQZbmJbOCfe7igwh1a7/xlG7RDUCDSDiLtrUYat
	HPuPo5sZtonRzxar+YECjZYIX
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr367646685a.3.1787045248730;
        Tue, 18 Aug 2026 02:27:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4049:b0:936:5a34:7a6a with SMTP id af79cd13be357-937071938a9mr367644885a.3.1787045248386;
        Tue, 18 Aug 2026 02:27:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b73540sm127584066b.29.2026.08.18.02.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:27:27 -0700 (PDT)
Message-ID: <c4b2917e-c1e3-42c5-a947-ed906429730d@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:27:25 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: add Xiaomi Mi 8 (dipper)
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260809-dipper-v1-0-eb4d501e85df@ixit.cz>
 <20260809-dipper-v1-2-eb4d501e85df@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-dipper-v1-2-eb4d501e85df@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfXzMVF3UFrGyUm
 ACXYjndGB4eSMVJ9nVfQXR62kpUk6ofZvO82JjgOrjhpvOlR+0D8F9/bOFxawAC0M/c6OrCVfRP
 IcQNQEXP8M5FRtCX/KTlDOkbIeIwB+0=
X-Authority-Analysis: v=2.4 cv=VuITxe2n c=1 sm=1 tr=0 ts=6a842581 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=NmR4qx3jlBvMWm_aBiAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: YUHnrDe6ME3a8kK1wztuyY7xzf1K7rpm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2OSBTYWx0ZWRfXyWY8qxsp8krD
 Opq4TWZOcEsBER2YmumjyV7sIdkPS/Faz6lnqk9H77sHvunWcNAHAldDktWUj6ROh7eColWYEOf
 cygxPuWWum3CCE0Sev3qj3stFiAMUFUK7Ljh5W73udAmd6tx5Akq+wHkk7lvl47dFnBx1D51rDw
 uFKcP2gA8EgnliVI3jb0ByhnaypMSYbuDKaOoVYr/0lZ6RO6QKHRZQp1JLPYUssfhSV9UW/blet
 dyiNsSIqK+KEbSfBLY8ZsVI5CfyE2vjljkP58V1t/wGqtbsCbVyhETLULrruC08yAEINr0qudRz
 mNgdYPkVuGmqJ6cHKIz/7q4G5MK7RIv+vCErqZniEMUBTZ2gXugycWo4c+MNLniZH0+B0wax/QB
 Xvs8NIotdXa8ofeTy78pJFuvd/V2rAsh7ItOrpG0jy3o7Daq8y8wGkQwgQEbkIp0zGLy4zxVjqY
 dR0N+eyIlT/m0U7QcsA==
X-Proofpoint-ORIG-GUID: YUHnrDe6ME3a8kK1wztuyY7xzf1K7rpm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180069

On 8/9/26 6:48 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Initial submission for one member of the prime Xiaomi Mi 8 family.
> Mi 8 Pro (equuleus) and Mi 8 Explorer (ursa) are nearly identical.
> Known differences are battery capacity and fingerprint sensor placement.
> This submission includes basic abstraction for other developers to be
> able easily extend it to support other variants.

[...]

> +/ {
> +	chassis-type = "handset";
> +
> +	qcom,msm-id = <QCOM_ID_SDM845 0x20001>;

Is this necessary to boot?

Konrad
