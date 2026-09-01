Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F9E3FA5F0
	for <devicetree@vger.kernel.org>; Tue,  1 Sep 2026 14:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274022; cv=pass; b=GoR88lx9XCT9phUd2vvypfKhqGh+Jr1UttZTcAfrji3+rSursnKJiSKM/N0lf28vIskPD4L1Asrsyw4Nw9dK0JUZ/htPnXH3PmCzX+OgzpZ5FjkfNdrsd5R3xEQ22L/5l4PktAWF27cD9jkRlUlc2p/mGnOowxNrINZiGLZl2Ac=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274022; c=relaxed/simple;
	bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HmzGghN8MbLAdnQu51M7KhPY5Mrajt7l6Kwnbxz7JCB/X+YsdAaHzD0ehLw9JSd74Uu8nXQ1unFGTqfxpZm4dY6HG+ZeBA9KLCZBMsBL9nBlKrJZw2fzJqJapZmDGhmZSCBZ5eKWSdDs9oA2roPNvySU2z++SgohoiSs1viDQ+M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJYQ3j39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dllRBTIx; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJYQ3j39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dllRBTIx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E8e9O3913722
	for <devicetree@vger.kernel.org>; Tue, 1 Sep 2026 14:47:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dT3RN5VdEwJ2zJ5PYII/r+JE
	HnQOkc7pAjMxC21FiBY=; b=LJYQ3j39rNg3jWlWWauFXljfGn0CDk4MSMJrmPlv
	L15NtYDyNfvCTM4m3op85ejvzHPlnVv5fmfGigCpij00OFLABTu4XisP7YPYy6Ij
	9/CwakbGQbgKzBmT+ZJTZRpU7Ayr2cP02DMLfqbI7aLeRqAEFwqeFkWEStD70qn/
	aReYSwd/sgFUYw5VU/9KvIm3S30u3taNTCy/FKbU9oAFRgLFhO9zEz3JGIIhqxJH
	hIUyfgxjAALr/cGeJjOAlXCVucSem4oZ3BmP1fGJMmpCSvmqGDLh4pEd3weG6Tjt
	GxBXCVJqfYmlWybdPMpp4B0VPXv4n+L4zyU38VACb+eVpg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdsnu260f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 14:47:00 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-845f687dfa2so93224877b3.2
        for <devicetree@vger.kernel.org>; Tue, 01 Sep 2026 07:47:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274019; cv=none;
        d=google.com; s=arc-20260327;
        b=iO41IdX4JOGAik8MpHxlTyj+9x6Fx1tt+t19NYYmIidcU1ghJ6tkN+16BoNUzs7jdQ
         2dH0FwymgJozwGgQuBaIpenAz03lYgPekSZ8SBQeux++ICO+1uFVrjv7b4moaqeDG6i8
         bgDazEUEMLdzq5AF9Vl4wwnq3IN9aBA3kTJsCNPMy9VHnMNvs+WvuxpXVY5KTZsE4VQp
         KH4cDO8NK1imI43vnlwpD+gN+T6I0wCtp8wXLS18l4wK5Q5Nj63WMar2b24bR9hKtG1x
         Yn4+mRnFLaPzEIbhl6Hga6R1k1dzuQBfMezz0vZKe5W5PzfO2n8ywhuVWhrvaoiM27lU
         OQjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        fh=ORRDayrhW9zlPXGE4h3ZjiMYiYeTDtxzxsj0rxTHhTk=;
        b=oSMI+ZflxHYS7IC4n5PYUAUBdklcpD9iuavjYTrYmZVG+bL67FuKg/kasIe+tXG8+C
         stJc35xIsD5Z5AZfnhdKgThCqLO2h/QeoyGKssfFOEAM0zw3MjFnal+xwhjGAVoX+SR8
         OOY/fPo992lkiEcGtXLlroSG3Q7rb33aPxb0wU/QFH07Bsz0Dyt3Afp3tB4z2bBLqTak
         u4lKkhoKCnJHpxHefhaIqmow+ElGXTgxhRSzuGyuye8a8hm6FgOCrvqWX3P2cKUJYosJ
         aY2suXVAP3LA6OuSOuJXunz0J4KyttnYM+xxTZ7pRee710QbwapGlrHUDv9bBBmaY8Su
         cnMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274019; x=1788878819; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=dllRBTIx4NEgI6OsD8au0l3ld558I9KBnwJ2DFs/pHFivbInfGIark1LzbjJQHhakA
         JtB4U9dR3TnwB9K4JirOCaip0rxRR7yJ6H/qWZ323sSsgFxBnAoupVJwZxLlRhgn+HlO
         eP4BOWJJ96pexKHXzdVc5nB+FiIHZlyet0hx9TVvMusY3lC2cFCE/CI4EUN5mxxzN1sy
         0Y4/LEkT/InJDNzFVjsuxtPM42BkjKh4SZ75AT4v+nIevHo2jWfcixf0mkWBk2vR+0A0
         paLPELuGz+hOdCFJurkovB2SwgDvHzqezqWt2cRVxrKeHv5geh/8ZJ/z+MWr/qY2I8d+
         jzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274019; x=1788878819;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=aWlVbSxjzFaKI4xx87QQNHO802dpbYk8P7PCeGnuUcapzgHRQkDx1Qp++Y7NA4ZB+C
         LddLJDx9IKaxPOJO07yZFbqxnnxwkV4uF4boYTx2w3h/7y1VasrffU7j9L1UCJ4o7Gl+
         NA0TxnybQf+p4wvuDS9ELQqV71h2biTFVwm9iZ9IMxBE84ul7AbaNB9ACsdQlzms8oa7
         nYStZVoxXDXxq8t9rAD8LCMC8gRqMAJcZeDSgjCttucJOiljL1lj127j7Ps/WqpwZkcW
         1/LMIl4bNVni78id4EgPZdIIiIFQ6f41SAZB4uBWMUwAtQR7lG+jqsJyrdT2c9a1rIte
         MMVA==
X-Forwarded-Encrypted: i=1; AKwUvBwqslPYJ/fZcXI1xCrTcRPfq2GC6ebfHJSZGv3NGT3ncRl7QXTMBXpPHph/EdLmhh4QUgXLXP+6AzR9@vger.kernel.org
X-Gm-Message-State: AFuF++kddxlaeHVtMv/ADhZ6K1eHp6uMX56uNSXmpOx7cQku0f2k+mk2
	b55gxybM88dNXa/ggAz1adHy6KqhGrGt0igjQDkcrjBVpL7IGOJPGJlL5WiMAcCc8C5lc6HWn6c
	iU2LhJjJhmp/34UFPqYkyfV9j6u9RROz+k/2BEaIB4fUOib5TXSIjaHALIY6PnzwNVBiJFEk0kx
	XvOHfreE+SVdjX7vwgV98X6eQTfBVohES6Xxt0xck=
X-Gm-Gg: AYBFou1yKPW/aGxCC0lgKf8oGttfpWJSSny5baNQBpxUUoJp1mgkUFPeaCVbnDzSdY/
	Eqnr+zQ+E11Yx0AvIpt+asC3SV7GIweeAzl3jrwsgtqWsUH86BzbHGfU2vceNYHbyq7fHIL9eaR
	sfiAzo5D0IKaZxH9O77UHskm5o5SQtohA/UyRFDOSDkbvlGVEf0NTfpMO2Hz0=
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id 956f58d0204a3-66f856546f4mr2647741d50.24.1788274019374;
        Tue, 01 Sep 2026 07:46:59 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id
 956f58d0204a3-66f856546f4mr2647716d50.24.1788274018846; Tue, 01 Sep 2026
 07:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
In-Reply-To: <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 20:16:46 +0530
X-Gm-Features: AcwNN1WVNVZF23H9olknWUBf0jBjDI0S1tPmtjMycntbFFHs18PkVuP9uKwJBYw
Message-ID: <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfXyfqXDqQaVVr4
 J9Hf57va33p1nEWjSPcVAG+7M04h00KK0I2hz8nBHMxktq+O4hIUJriZupxue7rhHoaUIC+NPTX
 ee4BVhbzetzEUZZ72mx0mqwJk6UISOEzs8VWCo+/89BwImwK48pLAgKgRhbZF/EbcMJx9Kmepta
 ozVm+vDoruYBYH4dyIUtmAkXhtSjUWGb30BQqbyjt6LDpowYgjG5tZdG8K1mjkz5jEwP62lTXe3
 QnEnA0SAOqWBX+XsbdZscGWuBOPawdYugpa7/VCYwxrT1BccjFiOSK3zJ1vMq6vA29Byh/nQU2F
 eNz9O2k3uCDWt5NdnKJkAecyFtu53e1Z6+x0mtTdRPYY7CPR5v3YrzRmUbmAuT+Z5dLCHDfY8W7
 J43e4awpKquVPWJd2CLonR+y0Zw5CrW5C4WivWk5zA+Elp7O2k0+doB37zr2wFWubJQbnrviGno
 oQmW+UTwfezJB92bnYQ==
X-Authority-Analysis: v=2.4 cv=L6ItheT8 c=1 sm=1 tr=0 ts=6a96e564 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=ubUB8SH87j9vw69hzB4A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX3i+/yyTEa9vq
 elEkuAcr3fpJ8ZyjRHD5Bi+mq2LLXDZNKvWcwlyfbMU4RSClk9uPuwkwIwT02zzyJ3nuZrYHokv
 M8nsf+JjV3bOdsArsLNoU9rtpdI3RuQ=
X-Proofpoint-ORIG-GUID: tN8KMK51djmaOgTH-FpBKJLdSRLa2fWr
X-Proofpoint-GUID: tN8KMK51djmaOgTH-FpBKJLdSRLa2fWr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010131

> >> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> >> Usually DT binding filenames are aligned with the compatible string for clarity.
> >> Is there a reason for the naming mismatch?
> > The filename reflects the controller; the compatible is
> > variant-specific. This follows the same convention as
> > qcom,lpass-cpu.yaml.
> >>
>
> There is no compatible for controller and the only top-level compatible
> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
>
> And I already asked about this in v1. Why does this have to be repeated
> at v3?
The QAIF hardware IP is the same across platforms, only the board
integration details differ. The binding is meant to describe the IP
generically, with board-specific compatibles like qcom,shikra-qaif-cpu
used to distinguish variants. I had qcom,qaif-cpu as the generic
compatible in v2 but removed it in v3 as I was not clear about the
guideline. Could you please suggest the right approach for the
compatible and filename in this case?
>
> What about other comments from v1? Where they implemented?
v3 carries major changes in binding and code, which addresses all the
previous comments from all patches of v1 & v2. Requesting you to
please review v3.
-Harendra
>
> Best regards,
> Krzysztof
